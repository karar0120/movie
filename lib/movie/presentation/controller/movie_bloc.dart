import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_udamy/core/utils/enums.dart';
import 'package:movie_udamy/movie/presentation/controller/movie_event.dart';
import 'package:movie_udamy/movie/presentation/controller/movie_state.dart';

import '../../domain/use_case/get_now_playing_movies_use_case.dart';
import '../../domain/use_case/get_popular_movies_use_case.dart';
import '../../domain/use_case/get_top_rated_movies_use_case.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
 final GetNowPlayingMovieUseCase getNowPlayingMovieUseCase ;
 final GetPopularMovieUseCase getPopularMovieUseCase ;
 final GetTopRatedMovieUseCase getTopRatedMovieUseCase ;
  MovieBloc(this.getNowPlayingMovieUseCase,
      this.getPopularMovieUseCase,
      this.getTopRatedMovieUseCase
      ) : super(const MovieState()) {
    on<GetNowPlayingMovieEvent>(_getNowPlayingMovies);
    on<GetPopularMovieEvent>(_getPopularMovies);
    on<GetTopRatedMovieEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(GetNowPlayingMovieEvent event, Emitter<MovieState> emit) async{
    final result = await getNowPlayingMovieUseCase();
    result.fold((l) {
      emit(state.copyWith(
          nowPlayingMovieState: RequestState.error,
          nowPlayingMovieMessage: l.message));
    }, (r) {
      emit(state.copyWith(
        nowPlayingMovie: r,
        nowPlayingMovieState: RequestState.loaded,
      ));
    });
  }

  FutureOr<void> _getPopularMovies(GetPopularMovieEvent event, Emitter<MovieState> emit) async{
    final result = await getPopularMovieUseCase();
    result.fold((l) {
      emit(state.copyWith(
          popularMovieState: RequestState.error,
          popularMovieMessage: l.message));
    }, (r) {
      emit(state.copyWith(
        popularMovie: r,
        popularMovieState: RequestState.loaded,
      ));
    });
  }

  FutureOr<void> _getTopRatedMovies(GetTopRatedMovieEvent event, Emitter<MovieState> emit) async{
    final result = await getTopRatedMovieUseCase();
    result.fold((l) {
      emit(state.copyWith(
          topRatedMovieState: RequestState.error,
          topRatedMovieMessage: l.message));
    }, (r) {
      emit(state.copyWith(
        topRatedMovie: r,
        topRatedMovieState: RequestState.loaded,
      ));
    });
  }
}
