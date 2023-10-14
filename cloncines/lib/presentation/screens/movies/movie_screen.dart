
import 'package:cloncines/domain/entities/movie.dart';
import 'package:cloncines/presentation/providers/movies/movie_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieScreen extends ConsumerStatefulWidget {
  final String movieId;

  static const name = 'movie-screen';

  const MovieScreen({
    super.key, 
    required this.movieId
    });

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {

  @override
  void initState() {
    super.initState();

    ref.read(movieInfoProvider.notifier).LoadMovie(widget.movieId);


  }

  @override
  Widget build(BuildContext context) {

    final Movie? movie = ref.watch(movieInfoProvider)[widget.movieId];

    if (movie == null){
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(strokeWidth: 2,),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie: ${widget.movieId}'),
      ),
    );
  }
}