

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:cloncines/domain/entities/movie.dart';

typedef SearchoMoviesCallBack = Future<List<Movie>> Function(String query);

class SearchMovieDelete extends SearchDelegate<Movie?> {

  final SearchoMoviesCallBack searchMovies;

  SearchMovieDelete({
    required this.searchMovies,
  });

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
    
    return FutureBuilder(
      future: searchMovies(query), 
      builder: (context, snapshot) {
        
        final movies = snapshot.data ?? [];
        
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return ListTile(
              title: Text(movie.title),
            );
          },
        );
      },
    );

  }



}
