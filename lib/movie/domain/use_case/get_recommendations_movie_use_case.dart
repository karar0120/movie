import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_udamy/core/base_use_case/base_use_case.dart';
import 'package:movie_udamy/core/error/failure.dart';
import 'package:movie_udamy/movie/domain/entities/recommendatios.dart';
import 'package:movie_udamy/movie/domain/repository/base_movie_repository.dart';

class GetRecommendationsMovieUseCase extends BaseUseCase<List<Recommendations>, RecommendationsParameter> {
  BaseMovieRepository baseMovieRepository;
  GetRecommendationsMovieUseCase({required this.baseMovieRepository});

  @override
  Future<Either<Failure, List<Recommendations>>> call(RecommendationsParameter parameter)async {
 return await baseMovieRepository.getRecommendationsMovie(parameter);
  }
}

class RecommendationsParameter extends Equatable {
  final int movieId;

  const RecommendationsParameter({required this.movieId});

  @override
  List<Object?> get props =>[
    movieId
  ];
}
