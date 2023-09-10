

import 'package:cloncines/domain/entities/movie.dart';

abstract class MovieRepository{

  Future<List<Movie>>getNowPlay({int page = 1});
  

}