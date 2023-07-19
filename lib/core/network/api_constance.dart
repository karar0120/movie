class ApiConstance {
  static const String baseUrl='https://api.themoviedb.org/3';

  static const String apiKey='339e88dd9dab1f61475457ba7430450d';

  static const String nowPlayingMoviePath='$baseUrl/movie/now_playing?api_key=$apiKey';

  static const String topRatedMoviePath='$baseUrl/movie/top_rated?api_key=$apiKey';

  static const String popularMoviePath='$baseUrl/movie/popular?api_key=$apiKey';
}