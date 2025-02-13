import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:exam_box/constants/constants.dart';
import 'package:exam_box/Screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'constants/imageConstant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exam Box',
       debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
            body: Container(
              decoration: BoxDecoration(
                color: PrimaryColor
              ),
              child: AnimatedSplashScreen(
                duration: 1000,
                splash: Image.asset(
                  Images.Logo,
                ),
                splashIconSize: 1000,
                nextScreen: OnBoardingPageBody(),
              
                splashTransition: SplashTransition.scaleTransition,
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
    );
  }
}
