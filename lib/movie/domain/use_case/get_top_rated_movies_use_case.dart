import 'package:movie_udamy/movie/domain/entities/movie.dart';
import 'package:movie_udamy/movie/domain/repository/base_movie_repository.dart';

class GetTopRatedMovieUseCase {
  final BaseMovieRepository baseMovieRepository;

  GetTopRatedMovieUseCase({required this.baseMovieRepository});

  Future<List<Movie>> execute() async {
    return await baseMovieRepository.getTopRatedMovie();
  }
}
