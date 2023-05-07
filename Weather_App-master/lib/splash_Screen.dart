
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/pages/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
 

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>HomeScreen()
                ,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors: [
              Colors.white,
              Color.fromARGB(255, 182, 217, 246)
            ])),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    height: 230.0,
                    width: 230.0,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Weather App",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color:Colors.blue,),
                  ),
                ],
              ),
              CircularProgressIndicator(
                color:Colors.blue,
                backgroundColor:Colors.white,
                semanticsLabel: "Loading",
                semanticsValue: "Loading",
                strokeWidth: 7,
              )
            ]),
      ),
    );
  }
}