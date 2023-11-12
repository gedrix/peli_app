

import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:cloncines/config/helppers/human_formats.dart';
import 'package:flutter/material.dart';
import 'package:cloncines/domain/entities/movie.dart';

typedef SearchoMoviesCallBack = Future<List<Movie>> Function(String query);

class SearchMovieDelete extends SearchDelegate<Movie?> {

  final SearchoMoviesCallBack searchMovies;

  StreamController<List<Movie>> debouncdeMovies = StreamController.broadcast();
  Timer? _debounceTimer;
  SearchMovieDelete({
    required this.searchMovies,
  });

  void _onQueryChance(String query){
      if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

      _debounceTimer = Timer(const Duration(milliseconds: 500), (){
        // print('Buscando peli');
        //Todo buscar peli
      });
  }

  @override
  String get searchFieldLabel => 'Buscar película';

  @override
  List<Widget>? buildActions(BuildContext context) {
      return [
          FadeIn(
            animate: query.isNotEmpty,
            child: IconButton(
              onPressed: () => query = '',  //* query se encuentra en el SearchDelegate y es el que se va a enviar al api
              icon: Icon(Icons.clear)
            ),
          ),

      ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    
    return IconButton(
      onPressed: () => close(context, null), 
      icon: Icon(Icons.arrow_back_ios_new_outlined)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    
    return const Text('BuildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    
    _onQueryChance(query);
    return StreamBuilder(
      stream: debouncdeMovies.stream,
      // future: searchMovies(query), 
      builder: (context, snapshot) {

        final movies = snapshot.data ?? [];
        
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            // final movie = movies[index];
            // return ListTile(
            //   title: Text(movie.title),
            // );
            return _MovieItem(
              movie: movies[index],
              onMovieSelected: close,
            );
          },
        );
      },
    );
  }
}


class _MovieItem extends StatelessWidget {
  final Movie movie;
  final Function onMovieSelected;

  const _MovieItem({
      required this.movie, 
      required this.onMovieSelected
    });

  @override
  Widget build(BuildContext context) {
    
    final textStyles = Theme.of(context).textTheme; 
    final size = MediaQuery.of(context).size; 

    return GestureDetector(
      onTap: () {
        onMovieSelected(context, movie);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
    
            //*image
            SizedBox(
              width: size.width * 0.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  movie.posterPath,
                  loadingBuilder: (context, child, loadingProgress) => FadeIn(child: child),
                ),
              ),
            ),
            const SizedBox(width: 10),
    
            //*descripcion
            SizedBox(
              width: size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start ,
                children: [
                  Text(movie.title, style:  textStyles.titleMedium),
                  (movie.overview.length > 100)
                    ? Text('${movie.overview.substring(0,100)}...') 
                    : Text(movie.overview),
                  Row(
                    children: [
                      Icon(Icons.star_half_rounded, color: Colors.yellow.shade800),
                      SizedBox(width: 5,),
                      Text(
                        HumanFormats.number(movie.voteAverage, 2), 
                        style: textStyles.bodyMedium!.copyWith(color: Colors.yellow.shade900),
                      ),
                    ],
                  )
    
                  
                ],
              ),
            )
    
    
          ],
        ),
      ),
    );
  }
}