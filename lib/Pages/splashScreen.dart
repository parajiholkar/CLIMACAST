import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/Pages/HomePage.dart';

import '../Controller/globelController.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  final GlobalController globalController =
  Get.put(GlobalController(), permanent: true);
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      home();
    });
    super.initState();
  }

  void home() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
        'assets/Splash1.jpg',
        fit: BoxFit.fill,
      )),
    );
  }
}
