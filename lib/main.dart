import 'package:flutter/material.dart';
import 'package:ui_app/screens/launch_screen.dart';
import 'package:ui_app/screens/login_screen.dart';
import 'package:ui_app/screens/main_screen.dart';
import 'package:ui_app/screens/out_boarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/launch_screen',
      routes: {
        '/launch_screen': (context) => const LaunchScreen(),
        '/out_boarding_screen': (context) => const OutBoardingScreen(),
        '/login_screen': (context) => const LoginScreen(),
        '/main_screen': (context) => const MainScreen(),
      },
    );
  }
}

