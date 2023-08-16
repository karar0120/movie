import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_udamy/core/utils/enums.dart';
import 'package:movie_udamy/movie/data/model/movie_details_model.dart';
import 'package:movie_udamy/movie/domain/entities/movie_detail.dart';

import '../../domain/entities/recommendatios.dart';
import '../../domain/use_case/get_movie_detail_use_case.dart';
import '../../domain/use_case/get_recommendations_movie_use_case.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  GetMovieDetailUseCase getMovieDetailUseCase;

  GetRecommendationsMovieUseCase getRecommendationsMovieUseCase;

  MovieDetailsBloc(this.getMovieDetailUseCase,this.getRecommendationsMovieUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendations);
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailUseCase(MovieDetailsParameters(movieId: event.movieId));
    result.fold(
        (l) => emit(state.copyWith(
            movieDetailsMessage: l.message,
            movieDetailsRequestState: RequestState.error)),
        (r) => emit(state.copyWith(
            movieDetails: r, movieDetailsRequestState: RequestState.loaded)));
  }

  FutureOr<void> _getRecommendations(GetMovieRecommendationEvent event, Emitter<MovieDetailsState> emit) async{
   final result = await getRecommendationsMovieUseCase(RecommendationsParameter(movieId: event.movieId));

   result.fold((l) => emit(state.copyWith(
     movieRecommendationsMessage: l.message,
     movieRecommendationsRequestState: RequestState.error,
   )),
           (r) => emit(state.copyWith(
             movieRecommendations: r,
             movieRecommendationsRequestState: RequestState.loaded
           )));

  }
}
