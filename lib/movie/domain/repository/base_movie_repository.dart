import 'package:dartz/dartz.dart';
import 'package:movie_udamy/movie/domain/entities/movie.dart';
import 'package:movie_udamy/movie/domain/entities/movie_detail.dart';
import 'package:movie_udamy/movie/domain/entities/recommendatios.dart';
import 'package:movie_udamy/movie/domain/use_case/get_recommendations_movie_use_case.dart';

import '../../../core/error/failure.dart';
import '../use_case/get_movie_detail_use_case.dart';

abstract class BaseMovieRepository{

  Future<Either<Failure,List<Movie>>>getNowPlayingMovie();

  Future<Either<Failure,List<Movie>>>getPopularMovie();

  Future<Either<Failure,List<Movie>>>getTopRatedMovie();

  Future<Either<Failure,MovieDetails>>getMovieDetails(MovieDetailsParameters parameter);

  Future<Either<Failure,List<Recommendations>>>getRecommendationsMovie(RecommendationsParameter parameter);
}