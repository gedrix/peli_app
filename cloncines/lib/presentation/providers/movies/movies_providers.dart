


import 'package:cloncines/domain/entities/movie.dart';
import 'package:cloncines/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
 
 final fetchMoreMovies = ref.watch( movieRepositoryProvider).getNowPlaying;
  return MoviesNotifier(
    fetchMoreMovie:  fetchMoreMovies
  );

});


typedef MovieCallback = Future<List<Movie>> Function({int page});


class MoviesNotifier extends StateNotifier<List<Movie>>{
  
  //pagina actual
  int currentPage = 0;
  MovieCallback fetchMoreMovie;

  MoviesNotifier({
        required this.fetchMoreMovie,
  }):super([]);

  Future<void> loadNextPate()async{
    currentPage++;

    final List<Movie> movies = await fetchMoreMovie(page: currentPage);

    state = [...state, ...movies];
  }

}
