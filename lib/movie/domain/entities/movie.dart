import 'package:equatable/equatable.dart';

class Movie extends Equatable{
  final int id;
  final String title;
  final List<int>genreIds;
  final String backdropPath;
  final String overview;
  final double voteAverage;
  final String releaseDate;

 const  Movie({
    required this.title,
    required  this.genreIds,
    required this.overview,
    required this.voteAverage,
    required this.backdropPath,
    required this.id,
    required this.releaseDate,
 });

  @override
  List<Object> get props => [
    title,
    genreIds,
    overview,
    voteAverage,
    backdropPath,
    id,
    releaseDate
  ];
}