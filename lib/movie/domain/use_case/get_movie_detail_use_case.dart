import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_udamy/core/base_use_case/base_use_case.dart';
import 'package:movie_udamy/core/error/failure.dart';
import 'package:movie_udamy/movie/domain/entities/movie_detail.dart';
import 'package:movie_udamy/movie/domain/repository/base_movie_repository.dart';

class GetMovieDetailUseCase extends BaseUseCase<MovieDetails, MovieDetailsParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetMovieDetailUseCase({required this.baseMovieRepository});

  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailsParameters parameter) async{
    return await baseMovieRepository.getMovieDetails(parameter);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({required this.movieId});

  @override
  List<Object?> get props => [
    movieId
  ];
}
