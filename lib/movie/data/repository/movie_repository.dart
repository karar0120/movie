import 'package:dartz/dartz.dart';
import 'package:movie_udamy/core/error/exceptions.dart';
import 'package:movie_udamy/core/error/failure.dart';
import 'package:movie_udamy/movie/data/data_source/movie_remote_data_sorce.dart';
import 'package:movie_udamy/movie/domain/entities/movie.dart';
import 'package:movie_udamy/movie/domain/entities/movie_detail.dart';
import 'package:movie_udamy/movie/domain/entities/recommendatios.dart';
import 'package:movie_udamy/movie/domain/repository/base_movie_repository.dart';
import 'package:movie_udamy/movie/domain/use_case/get_movie_detail_use_case.dart';
import 'package:movie_udamy/movie/domain/use_case/get_recommendations_movie_use_case.dart';

class MovieRepository extends BaseMovieRepository {
  BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MovieRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovie() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovie() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovie() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameter) async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(parameter);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendations>>> getRecommendationsMovie(
      RecommendationsParameter parameter) async {
    final result =
        await baseMovieRemoteDataSource.getRecommendationsMovies(parameter);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(  ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }
}
