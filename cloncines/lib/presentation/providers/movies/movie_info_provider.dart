
import 'package:cloncines/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloncines/domain/entities/movie.dart';


final movieInfoProvider = StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {

  final moviesRepository = ref.watch(movieRepositoryProvider);

  return MovieMapNotifier(getMovie: moviesRepository.getMovieById);

});

typedef GetMOvieCallback = Future<Movie>Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {

  final GetMOvieCallback getMovie;

  MovieMapNotifier({
    required this.getMovie,
  }): super({});


  Future<void> LoadMovie(String movieId) async{
    if(state[movieId] != null) return null;

    final movie = await getMovie(movieId);

    state = { ...state, movieId: movie};
  }
}
