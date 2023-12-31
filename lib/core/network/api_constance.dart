class ApiConstance {
  static const String baseUrl='https://api.themoviedb.org/3';

  static const String apiKey='339e88dd9dab1f61475457ba7430450d';

  static const String nowPlayingMoviePath='$baseUrl/movie/now_playing?api_key=$apiKey';

  static const String topRatedMoviePath='$baseUrl/movie/top_rated?api_key=$apiKey';

  static String movieDetailPath (int movieId) =>'$baseUrl/movie/$movieId?api_key=$apiKey';

  static String recommendationsPath (int movieId) =>'$baseUrl/movie/$movieId/recommendations?api_key=$apiKey';


  static const String popularMoviePath='$baseUrl/movie/popular?api_key=$apiKey';

  static const String imagePathUrl ='https://image.tmdb.org/t/p/w500';

  static  String imageUrl(String path)=> '$imagePathUrl$path';
}