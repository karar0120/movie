import 'package:dartz/dartz.dart';
import 'package:movie_udamy/movie/domain/entities/movie.dart';
import 'package:movie_udamy/movie/domain/repository/base_movie_repository.dart';

import '../../../core/base_use_case/base_use_case.dart';
import '../../../core/error/failure.dart';

class GetPopularMovieUseCase  extends BaseUseCase<List<Movie>,NoParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetPopularMovieUseCase({required this.baseMovieRepository});

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameter) async{
    return await baseMovieRepository.getPopularMovie();
  }

}
