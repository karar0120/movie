import 'package:movie_udamy/movie/domain/entities/movie.dart';
import 'package:movie_udamy/movie/domain/repository/base_movie_repository.dart';

class GetNowPlayingMovieUseCase {
  final BaseMovieRepository baseMovieRepository;

  GetNowPlayingMovieUseCase({required this.baseMovieRepository});

  Future<List<Movie>> execute() async {
    return await baseMovieRepository.getNowPlayingMovie();
  }
}
