import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetNowPlayingMovieEvent extends MovieEvent {}

class GetPopularMovieEvent extends MovieEvent {}

class GetTopRatedMovieEvent extends MovieEvent {}