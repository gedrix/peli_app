

import 'package:cloncines/domain/entities/movie.dart';

abstract class MoviesDatasurce{

  Future<List<Movie>>getNowPlaying({int page = 1});
  

}