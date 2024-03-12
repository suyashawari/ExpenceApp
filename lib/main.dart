import 'package:expence_tracker/expence_tracker.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 136, 243, 238));
final kDarkColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 11, 52, 90),
    brightness: Brightness.dark);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(
          colorScheme: kColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
          ),
          cardTheme: const CardTheme().copyWith(
              color: kColorScheme.primaryContainer,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            foregroundColor: kColorScheme.onPrimaryContainer,
          )),
          textTheme: const TextTheme().copyWith(
              titleLarge: const TextStyle(
            fontWeight: FontWeight.normal,
            color: Colors.white,
            fontSize: 22,
          ))),
          darkTheme: ThemeData.dark().copyWith(
            colorScheme: kDarkColorScheme,
            appBarTheme:const AppBarTheme().copyWith(
              backgroundColor: kDarkColorScheme.onPrimaryContainer,
              foregroundColor: Colors.white,
            ),
            cardTheme:const CardTheme().copyWith(
              color: kDarkColorScheme.secondaryContainer,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              
            ),
            textTheme:const TextTheme().copyWith(
              titleLarge: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )
            ),
            
          ),
          themeMode: ThemeMode.dark,
      home: const ExpenceTracker(),
    );
  }
}
