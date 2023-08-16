import 'package:movie_udamy/movie/data/model/Genre_model.dart';
import 'package:movie_udamy/movie/domain/entities/genre.dart';
import 'package:movie_udamy/movie/domain/entities/movie_detail.dart';

class MovieDetailsModel extends MovieDetails{
  const MovieDetailsModel({
    required super.overview,
    required super.releaseDate,
    required super.runtime,
    required super.voteAverage,
    required super.title,
    required super.backdropPath,
    required super.id,
    required super.genre});

 factory MovieDetailsModel.formJson(Map<String,dynamic>json)=>MovieDetailsModel(
    overview: json['overview'],
     releaseDate: json['release_date'],
     runtime: json['runtime'],
     voteAverage: json['vote_average'],
     title: json["title"],
     backdropPath:json['backdrop_path'],
     id:json['id'],
     genre: List<GenreModel>.from(json['genres'].map((x)=>
         GenreModel.formJson(x))));

}