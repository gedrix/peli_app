import 'package:flutter_dotenv/flutter_dotenv.dart';


class Environment {

    static String theMovieDbKey  = dotenv.env['THE_MOVIE_DB_KEY'] ?? 'no hay api';

    static String nameApp = dotenv.env['Name_App'] ?? 'Cine'; 
}