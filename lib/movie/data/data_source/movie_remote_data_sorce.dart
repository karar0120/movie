import 'package:dio/dio.dart';
import 'package:movie_udamy/core/network/api_constance.dart';
import 'package:movie_udamy/core/network/error_massage_model.dart';
import 'package:movie_udamy/movie/data/model/movies_model.dart';

import '../../../core/error/exceptions.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(
        ApiConstance.nowPlayingMoviePath);
    if (response.statusCode == 200) {
      return List.from(
          (response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(errorMessageModel:ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async{
    final response = await Dio().get(
        ApiConstance.popularMoviePath);
    if (response.statusCode == 200) {
      return List.from(
          (response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(errorMessageModel:ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async{
    final response = await Dio().get(
        ApiConstance.topRatedMoviePath);
    if (response.statusCode == 200) {
      return List.from(
          (response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(errorMessageModel:ErrorMessageModel.fromJson(response.data));
    }
  }
}
