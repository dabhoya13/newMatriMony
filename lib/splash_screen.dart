import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:newmatrimony/Screen1.dart';
import 'package:newmatrimony/login.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return (AnimatedSplashScreen(
      splash: Image.asset('assets/images/splash.png'),
      nextScreen: Login(),
      splashTransition: SplashTransition.scaleTransition,
      splashIconSize: 200,
      duration: 3000,
      backgroundColor: Color.fromARGB(255,255,88,132),

    ));
  }
}
