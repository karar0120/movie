import 'package:movie_udamy/movie/domain/entities/movie.dart';

abstract class BaseMovieRepository{

  Future<List<Movie>>getNowPlayingMovie();

  Future<List<Movie>>getPopularMovie();

  Future<List<Movie>>getTopRatedMovie();

}