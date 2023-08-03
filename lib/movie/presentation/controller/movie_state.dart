import 'package:equatable/equatable.dart';
import 'package:movie_udamy/core/utils/enums.dart';

import '../../domain/entities/movie.dart';

class MovieState extends Equatable {
  final List<Movie> nowPlayingMovie;
  final RequestState nowPlayingMovieState;
  final String nowPlayingMovieMessage;
  final List<Movie> popularMovie;
  final RequestState popularMovieState;
  final String popularMovieMessage;
  final List<Movie> topRatedMovie;
  final RequestState topRatedMovieState;
  final String topRatedMovieMessage;


  const MovieState(
      {this.nowPlayingMovie = const [],
      this.nowPlayingMovieState = RequestState.loading,
      this.nowPlayingMovieMessage = '',
        this.popularMovie = const [],
        this.popularMovieState=RequestState.loading,
        this.popularMovieMessage='',
        this.topRatedMovie=const [],
        this.topRatedMovieMessage='',
        this.topRatedMovieState=RequestState.loading,
      });


  MovieState copyWith({
     List<Movie>? nowPlayingMovie,
     RequestState? nowPlayingMovieState,
     String? nowPlayingMovieMessage,
     List<Movie>? popularMovie,
     RequestState? popularMovieState,
     String? popularMovieMessage,
     List<Movie>? topRatedMovie,
     RequestState? topRatedMovieState,
     String? topRatedMovieMessage,
}){
  return MovieState(
    nowPlayingMovie: nowPlayingMovie??this.nowPlayingMovie,
    nowPlayingMovieState:nowPlayingMovieState??this.nowPlayingMovieState ,
    nowPlayingMovieMessage:nowPlayingMovieMessage??this.nowPlayingMovieMessage ,
    popularMovie:popularMovie??this.popularMovie ,
    popularMovieState:popularMovieState??this.popularMovieState ,
    popularMovieMessage:popularMovieMessage??this.popularMovieMessage ,
    topRatedMovie: topRatedMovie??this.topRatedMovie,
    topRatedMovieMessage: topRatedMovieMessage??this.topRatedMovieMessage,
    topRatedMovieState: topRatedMovieState??this.topRatedMovieState,
  );
  }

  @override
  List<Object?> get props => [
    nowPlayingMovie,
    nowPlayingMovieState,
    nowPlayingMovieMessage,
    popularMovie,
    popularMovieMessage,
    popularMovieState,
    topRatedMovieState,
    topRatedMovieMessage,
    topRatedMovie,
  ];
}
