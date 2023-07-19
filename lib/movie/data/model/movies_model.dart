import 'package:movie_udamy/movie/domain/entities/movie.dart';

class MovieModel extends Movie{

 const MovieModel({
    required super.title,
    required super.genreIds,
    required super.overview,
    required super.voteAverage,
    required super.backdropPath,
    required super.id,
    required super.releaseDate});

 factory MovieModel.fromJson(Map<String,dynamic>json)=>MovieModel(
     title:json['title'],
     genreIds: List<int>.from(json['genreIds'].map((e)=>e)),
     overview: json['overview'],
     voteAverage: json['voteAverage'],
     backdropPath: json['backdrop_path'],
     id: json['id'],
     releaseDate: json['releaseDate']);
}