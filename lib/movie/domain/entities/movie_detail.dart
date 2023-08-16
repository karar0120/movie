import 'package:equatable/equatable.dart';

import 'genre.dart';

class MovieDetails extends Equatable {
  final String backdropPath;
  final int id;
  final List<Genre>genre;
  final String overview;
  final String releaseDate;
  final int runtime;
  final double voteAverage;
  final String title;

  const MovieDetails(
      {required this.overview,
      required this.releaseDate,
      required this.runtime,
      required this.voteAverage,
      required this.title,
      required this.backdropPath,
      required this.id,
      required this.genre});

  @override
  List<Object?> get props => [
        backdropPath,
        id,
        voteAverage,
        runtime,
        releaseDate,
        overview,
        title,
        genre
      ];
}
