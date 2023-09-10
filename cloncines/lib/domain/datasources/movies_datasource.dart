

import 'package:cloncines/domain/entities/movie.dart';

abstract class MovieDatasurce{

  Future<List<Movie>>getNowPlay({int page = 1});
  

}