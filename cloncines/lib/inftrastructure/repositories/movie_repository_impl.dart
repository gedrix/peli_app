

import 'package:cloncines/domain/datasources/movies_datasource.dart';
import 'package:cloncines/domain/entities/movie.dart';
import 'package:cloncines/domain/repositories/movies_repository.dart';

class  MovieRepositoryImpl extends MoviesRepository{
  
  final MoviesDatasource datasource;
  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return this.datasource.getNowPlaying(page: page);
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) {

    return this.datasource.getPopular(page: page);
  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return this.datasource.getUpcoming(page: page);
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return this.datasource.getTopRated(page: page);
  }


}