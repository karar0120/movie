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
     genreIds: List<int>.from(json['genre_ids'].map((e)=>e)),
     overview: json['overview'],
     voteAverage: json['vote_average'].toDouble(),
     backdropPath: json['backdrop_path'].toString(),
     id: json['id'],
     releaseDate: json['release_date']);
}