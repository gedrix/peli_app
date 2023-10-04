


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
  bool isLoading = false;
  MovieCallback fetchMoreMovie;

  MoviesNotifier({
        required this.fetchMoreMovie,
  }):super([]);

  Future<void> loadNextPate()async{
    currentPage++;
    if (isLoading) return;
    print('cargando mas peliculas');
    isLoading=true;
    await Future.delayed(const Duration(milliseconds: 300)); //opcional
    final List<Movie> movies = await fetchMoreMovie(page: currentPage);

    state = [...state, ...movies];

    isLoading=false;
  }

}
