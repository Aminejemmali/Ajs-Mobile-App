import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ajs_mobile_app/screens/welcome_screen.dart';
import 'package:ajs_mobile_app/screens/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('first_time') ?? true;

    await Future.delayed(Duration(seconds: 3));

    if (isFirstTime) {
      prefs.setBool('first_time', false);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => WelcomeScreen()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.network(
            'https://firebasestorage.googleapis.com/v0/b/aminejameliservices.appspot.com/o/mobile_app_ressources%2Fanimations%2FAJS_LOADING.json?alt=media&token=37c2ffde-03a4-44c3-aa3f-12a596314fa1'),
      ),
    );
  }
}