
import 'package:cloncines/domain/entities/actor.dart';
import 'package:cloncines/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final actorByMovieProvider = StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>((ref) {

  final actorsRepository = ref.watch(actorsRepositoryProvider);

  return ActorsByMovieNotifier(getActors: actorsRepository.getActorsByMovie);

});

typedef GetActorsCallback = Future<List<Actor>>Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {

  final GetActorsCallback getActors;

  ActorsByMovieNotifier({
    required this.getActors,
  }): super({}); //se inicializa como un mapa vacio


  Future<void> LoadActors(String movieId) async{
    if(state[movieId] != null) return null;

    final List<Actor> actors = await getActors(movieId);

    state = { ...state, movieId: actors};
  }
}
