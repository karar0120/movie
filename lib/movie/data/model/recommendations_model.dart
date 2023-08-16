import 'package:movie_udamy/movie/domain/entities/recommendatios.dart';

class RecommendationsModel extends Recommendations {
  const RecommendationsModel({required super.id,super.backdropPath});


  factory RecommendationsModel.fromJson (Map<String,dynamic>json)=>RecommendationsModel(
      id: json['id'],
      backdropPath: json['backdrop_path']??"/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg");

}
