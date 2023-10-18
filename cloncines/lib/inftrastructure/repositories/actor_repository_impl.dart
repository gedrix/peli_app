

import 'package:cloncines/domain/datasources/actors_datasource.dart';
import 'package:cloncines/domain/entities/actor.dart';
import 'package:cloncines/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository{
  
  final ActorsDataSource datasource;

  ActorRepositoryImpl(
     this.datasource
    );
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    return datasource.getActorsByMovie(movieId) ;
  }

}