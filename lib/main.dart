import 'package:flutter/material.dart';
import 'package:movie_app/core/services/services_locator.dart';
import 'package:movie_app/core/utils/app_string.dart';
import 'package:movie_app/fetures/movie/presentation/screens/movie_screens.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      home: const MoviesScreen(),
    );
  }
}
