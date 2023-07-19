import 'package:dartz/dartz.dart';
import 'package:movie_udamy/movie/domain/entities/movie.dart';

import '../../../core/error/failure.dart';

abstract class BaseMovieRepository{

  Future<Either<Failure,List<Movie>>>getNowPlayingMovie();

  Future<Either<Failure,List<Movie>>>getPopularMovie();

  Future<Either<Failure,List<Movie>>>getTopRatedMovie();

}