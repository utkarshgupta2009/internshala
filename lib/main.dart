import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshala/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.white)),
      debugShowCheckedModeBanner: false,
      title: 'Internshala',
      home: SplashScreen(),
    );
  }
}
