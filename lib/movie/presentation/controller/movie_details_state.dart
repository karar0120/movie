part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState movieDetailsRequestState;
  final String movieDetailsMessage;
  final List<Recommendations> movieRecommendations;
  final RequestState movieRecommendationsRequestState;
  final String movieRecommendationsMessage;


  const MovieDetailsState({
    this.movieDetails,
    this.movieDetailsRequestState = RequestState.loading,
    this.movieDetailsMessage = '',
    this.movieRecommendations= const [],
    this.movieRecommendationsRequestState = RequestState.loading,
    this.movieRecommendationsMessage = '',
  });

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsRequestState,
    String? movieDetailsMessage,
    List<Recommendations>? movieRecommendations,
    RequestState? movieRecommendationsRequestState,
    String? movieRecommendationsMessage,
  }) {
    return MovieDetailsState(
      movieDetailsRequestState:
          movieDetailsRequestState ?? this.movieDetailsRequestState,
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      movieRecommendationsRequestState:
      movieRecommendationsRequestState ?? this.movieRecommendationsRequestState,
      movieRecommendations: movieRecommendations ?? this.movieRecommendations,
      movieRecommendationsMessage: movieRecommendationsMessage ?? this.movieRecommendationsMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsMessage,
        movieDetailsRequestState,
    movieRecommendations,
    movieRecommendationsMessage,
    movieRecommendationsRequestState,
      ];
}
