

import 'package:animate_do/animate_do.dart';
import 'package:cloncines/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class SearchMovieDelete extends SearchDelegate<Movie?>{

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
    
    return const Text('BuildSuggestions');

  }



}