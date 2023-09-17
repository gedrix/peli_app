
import 'package:cloncines/config/constants/environment.dart';
import 'package:cloncines/domain/entities/movie.dart';
import 'package:cloncines/domain/datasources/movies_datasource.dart';
import 'package:cloncines/inftrastructure/mappers/movie_mapper.dart';
import 'package:cloncines/inftrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MoviedbDatasource extends MoviesDatasource {
 final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api-key': Environment.theMovieDbKey,
      'languaje': 'en-US'  //es-MX
    }
  ));
  
  @override
  Future<List<Movie>>getNowPlaying({int page = 1}) async{

    final response = await dio.get('/movie/now_playing');
    final movieDBResponse = MovieDbResponse.fromJson(response.data);  
    final List<Movie> movies = movieDBResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster')
    .map(
      (moviedb) => MovieMapper.movieDBToEntity(moviedb)
      ).toList(); 

      return movies;
  }

}