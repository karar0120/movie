
import 'package:get_it/get_it.dart';
import 'package:movie_udamy/movie/data/repository/movie_repository.dart';
import 'package:movie_udamy/movie/domain/use_case/get_now_playing_movies_use_case.dart';
import 'package:movie_udamy/movie/domain/use_case/get_popular_movies_use_case.dart';
import 'package:movie_udamy/movie/domain/use_case/get_top_rated_movies_use_case.dart';

import '../../movie/data/data_source/movie_remote_data_sorce.dart';
import '../../movie/domain/repository/base_movie_repository.dart';
import '../../movie/presentation/controller/movie_bloc.dart';

final sl = GetIt.instance;

class ServerLocator{

void init(){


  ///DataSource

  sl.registerLazySingleton<BaseMovieRemoteDataSource>(() =>MovieRemoteDataSource());

  ///Repository

  sl.registerLazySingleton<BaseMovieRepository>(() =>MovieRepository(sl()));

  ///UseCase

  sl.registerLazySingleton(() =>GetNowPlayingMovieUseCase(baseMovieRepository: sl()));

  sl.registerLazySingleton(() =>GetPopularMovieUseCase(baseMovieRepository: sl()) );

  sl.registerLazySingleton(() => GetTopRatedMovieUseCase(baseMovieRepository: sl()));

  /// bloc need to reload new data not use singleton use factory

  sl.registerFactory(() => MovieBloc(sl(),sl(),sl()));

}


}