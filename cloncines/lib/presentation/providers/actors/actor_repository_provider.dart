

import 'package:cloncines/inftrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:cloncines/inftrastructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorMovieDbDataSource());
});