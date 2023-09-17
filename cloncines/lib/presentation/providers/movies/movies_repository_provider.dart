
import 'package:cloncines/inftrastructure/datasources/moviedb_datasource.dart';
import 'package:cloncines/inftrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//este ropositorio es inmutable
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDatasource());
});