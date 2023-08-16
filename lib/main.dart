import 'package:flutter/material.dart';
import 'package:movie_udamy/core/servers/server_locator.dart';
import 'package:movie_udamy/core/utils/string_constance.dart';
import 'movie/presentation/screen/movies_screen.dart';

void main() {
  ServerLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringConstance.movieApp,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor:Colors.grey.shade900,
      ),
      home: const MoviesScreen(),
    );
  }
}
