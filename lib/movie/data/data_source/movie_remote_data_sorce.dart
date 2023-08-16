import 'package:dio/dio.dart';
import 'package:movie_udamy/core/network/api_constance.dart';
import 'package:movie_udamy/core/network/error_massage_model.dart';
import 'package:movie_udamy/movie/data/model/movies_model.dart';
import 'package:movie_udamy/movie/data/model/recommendations_model.dart';
import 'package:movie_udamy/movie/domain/use_case/get_movie_detail_use_case.dart';
import 'package:movie_udamy/movie/domain/use_case/get_recommendations_movie_use_case.dart';

import '../../../core/error/exceptions.dart';
import '../model/movie_details_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);
  Future<List<RecommendationsModel>> getRecommendationsMovies(RecommendationsParameter parameter);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(
        ApiConstance.nowPlayingMoviePath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
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
      return List<MovieModel>.from(
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
      return List<MovieModel>.from(
          (response.data['results'] as List).map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(errorMessageModel:ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters) async{
    final response = await Dio().get(
        ApiConstance.movieDetailPath(parameters.movieId));
    if (response.statusCode == 200) {
      return  MovieDetailsModel.formJson(response.data);
    } else {
      throw ServerException(errorMessageModel:ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationsModel>> getRecommendationsMovies(RecommendationsParameter parameter) async{
    final response = await Dio().get(
        ApiConstance.recommendationsPath(parameter.movieId));
    if (response.statusCode == 200) {
      return List<RecommendationsModel>.from(
          (response.data['results'] as List).map((e) => RecommendationsModel.fromJson(e)));
    } else {
      throw ServerException(errorMessageModel:ErrorMessageModel.fromJson(response.data));
    }
  }
}
