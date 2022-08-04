import 'package:flutter/material.dart';
import 'package:the_workout_app/pages/add_new_progress.dart';
import 'package:the_workout_app/pages/home.dart';
import 'package:the_workout_app/pages/progress_analytics.dart';
import 'package:the_workout_app/theme_extras/extra_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Workout App 0_0',
      theme: ThemeData(
        primarySwatch: primaryBlack,
        scaffoldBackgroundColor: const Color(0xFF151515),
      ),
      initialRoute: '/home',
      routes: {
        '/home' : (context) => const HomePage(),
        '/add_new_progress' : (context) => const AddNewProgress(),
        '/progress_analytics' : (context) => const ProgressAnalytics(),
      },
    );
  }
}
