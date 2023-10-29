import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather/Model/wather/wather.dart';
import '../Controller/globelController.dart';
import '../Model/wather/weather.dart';
import '../Model/weatherData.dart';

class weatherHome extends StatefulWidget {
  const weatherHome({super.key});

  @override
  State<weatherHome> createState() => _weatherHomeState();
}

class _weatherHomeState extends State<weatherHome> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  late Wather wather ;
  String ForeCast = 'Hourly';

  @override
  void initState() {
    wather = globalController.weatherData.value.current!.wather;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(46, 51, 90, 100),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/houseBG.png'), fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${globalController.getCity()}, ${wather.sys!.country}',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  RichText(
                      text: TextSpan(
                    text: '${(wather.main!.temp! - 273.15).round()}°',
                    style: TextStyle(fontSize: 75, color: Colors.white),
                  )),
                  Text(
                    wather.weather![0].description.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w700, color: Colors.grey),
                  ),
                  Text(
                    '${DateFormat('yMMMMd').format(DateTime.now())}',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45),
                    topRight: Radius.circular(45)),
                child: Container(
                  color: Color.fromRGBO(46, 51, 90, .40),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(255, 255, 255, 0.10),
                              width: 1.5),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(45),
                              topRight: Radius.circular(45))),
                      child: Column(
                        children: [
                          Icon(
                            Icons.horizontal_rule_rounded,
                            size: 25,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    ForeCast = 'Hourly';
                                  });
                                },
                                child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: (ForeCast == 'Hourly')
                                        ? BoxDecoration(
                                            border:
                                                Border.all(color: Colors.white),
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.20),
                                            borderRadius:
                                                BorderRadius.circular(20))
                                        : BoxDecoration(),
                                    child: Text(
                                      "Hourly Forecast",
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    ForeCast = 'Weekly';
                                  });
                                },
                                child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: (ForeCast == 'Weekly')
                                        ? BoxDecoration(
                                            border:
                                                Border.all(color: Colors.white),
                                            color:
                                                Color.fromRGBO(0, 0, 0, 0.20),
                                            borderRadius:
                                                BorderRadius.circular(20))
                                        : BoxDecoration(),
                                    child: Text(
                                      'Weekly Forecast',
                                      style: TextStyle(color: Colors.white),
                                    )),
                              )
                            ],
                          ),
                          Container(
                            height: 2,
                            width: double.infinity,
                            margin: EdgeInsets.only(left: 8, right: 8),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, .08),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: 20, bottom: 25, left: 10),
                              child: (ForeCast == 'Hourly')
                                  ? Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 5, right: 5),
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  46, 51, 90, 10),
                                              border: Border.all(
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, .20),
                                                  width: 1.5),
                                              borderRadius:
                                                  BorderRadius.circular(45)),
                                          height: 150,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "Now",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Container(
                                                  height: 40,
                                                  width: 40,
                                                  child: Image.asset(
                                                      'assets/${wather.weather![0].icon!}.png')),
                                              Text(
                                                '${(wather.main!.temp! - 273.15).round()}°',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 5, right: 5),
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(0, 0, 0, 0.20),
                                              border: Border.all(
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, .20),
                                                  width: 1.5),
                                              borderRadius:
                                                  BorderRadius.circular(45)),
                                          height: 150,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                getTime(1),
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Container(
                                                  height: 40,
                                                  width: 40,
                                                  child: Image.asset(
                                                      'assets/03d.png')),
                                              Text(
                                                '${(wather.main!.temp! - 273.15).round()}°',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 5, right: 5),
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(0, 0, 0, 0.20),
                                              border: Border.all(
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, .20),
                                                  width: 1.5),
                                              borderRadius:
                                              BorderRadius.circular(45)),
                                          height: 150,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                getTime(2),
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Container(
                                                  height: 40,
                                                  width: 40,
                                                  child: Image.asset(
                                                      'assets/13d.png')),
                                              Text(
                                                '${((wather.main!.temp! - 273.15)+1).round()}°',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 5, right: 5),
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(0, 0, 0, 0.20),
                                              border: Border.all(
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, .20),
                                                  width: 1.5),
                                              borderRadius:
                                              BorderRadius.circular(45)),
                                          height: 150,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                getTime(3),
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Container(
                                                  height: 40,
                                                  width: 40,
                                                  child: Image.asset(
                                                      'assets/${wather.weather![0].icon!}.png')),
                                              Text(
                                                '${(wather.main!.temp! - 273.15).round()}°',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 5, right: 5),
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(0, 0, 0, 0.20),
                                              border: Border.all(
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, .20),
                                                  width: 1.5),
                                              borderRadius:
                                              BorderRadius.circular(45)),
                                          height: 150,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                getTime(4),
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Container(
                                                  height: 40,
                                                  width: 40,
                                                  child: Image.asset(
                                                      'assets/${wather.weather![0].icon!}.png')),
                                              Text(
                                                '${((wather.main!.temp! - 273.15)-1).round()}°',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 5, right: 5),
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(0, 0, 0, 0.20),
                                              border: Border.all(
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, .20),
                                                  width: 1.5),
                                              borderRadius:
                                              BorderRadius.circular(45)),
                                          height: 150,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                getTime(5),
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Container(
                                                  height: 40,
                                                  width: 40,
                                                  child: Image.asset(
                                                      'assets/13d.png')),
                                              Text(
                                                '${(wather.main!.temp! - 273.15).round()}°',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 5, right: 5),
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(0, 0, 0, 0.20),
                                              border: Border.all(
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, .20),
                                                  width: 1.5),
                                              borderRadius:
                                              BorderRadius.circular(45)),
                                          height: 150,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                getTime(6),
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Container(
                                                  height: 40,
                                                  width: 40,
                                                  child: Image.asset(
                                                      'assets/${wather.weather![0].icon!}.png')),
                                              Text(
                                                '${((wather.main!.temp! - 273.15)-2).round()}°',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 5, right: 5),
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(0, 0, 0, 0.20),
                                              border: Border.all(
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, .20),
                                                  width: 1.5),
                                              borderRadius:
                                              BorderRadius.circular(45)),
                                          height: 150,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                getTime(7),
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Container(
                                                  height: 40,
                                                  width: 40,
                                                  child: Image.asset(
                                                      'assets/${wather.weather![0].icon!}.png')),
                                              Text(
                                                '${(wather.main!.temp! - 273.15).round()}°',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 5, right: 5),
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(0, 0, 0, 0.20),
                                              border: Border.all(
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, .20),
                                                  width: 1.5),
                                              borderRadius:
                                              BorderRadius.circular(45)),
                                          height: 150,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                getTime(8),
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Container(
                                                  height: 40,
                                                  width: 40,
                                                  child: Image.asset(
                                                      'assets/03d.png')),
                                              Text(
                                                '${((wather.main!.temp! - 273.15)+1).round()}°',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 5, right: 5),
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(0, 0, 0, 0.20),
                                              border: Border.all(
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, .20),
                                                  width: 1.5),
                                              borderRadius:
                                              BorderRadius.circular(45)),
                                          height: 150,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                getTime(9),
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Container(
                                                  height: 40,
                                                  width: 40,
                                                  child: Image.asset(
                                                      'assets/${wather.weather![0].icon!}.png')),
                                              Text(
                                                '${(wather.main!.temp! - 273.15).round()}°',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 5, right: 5),
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(0, 0, 0, 0.20),
                                              border: Border.all(
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, .20),
                                                  width: 1.5),
                                              borderRadius:
                                              BorderRadius.circular(45)),
                                          height: 150,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                getTime(10),
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Container(
                                                  height: 40,
                                                  width: 40,
                                                  child: Image.asset(
                                                      'assets/${wather.weather![0].icon!}.png')),
                                              Text(
                                                '${(wather.main!.temp! - 273.15).round()}°',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 5, right: 5),
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: Color.fromRGBO(0, 0, 0, 0.20),
                                              border: Border.all(
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, .20),
                                                  width: 1.5),
                                              borderRadius:
                                              BorderRadius.circular(45)),
                                          height: 150,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                getTime(11),
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Container(
                                                  height: 40,
                                                  width: 40,
                                                  child: Image.asset(
                                                      'assets/${wather.weather![0].icon!}.png')),
                                              Text(
                                                '${((wather.main!.temp! - 273.15)+2).round()}°',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  : Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 5, right: 5),
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(
                                            46, 51, 90, 10),
                                        border: Border.all(
                                            color: Color.fromRGBO(
                                                255, 255, 255, .20),
                                            width: 1.5),
                                        borderRadius:
                                        BorderRadius.circular(45)),
                                    height: 150,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          getDay(0),
                                          style: TextStyle(
                                              color: Colors.white),
                                        ),
                                        Container(
                                            height: 40,
                                            width: 40,
                                            child: Image.asset(
                                                'assets/${wather.weather![0].icon!}.png')),
                                        Text(
                                          '${(wather.main!.temp! - 273.15).round()}°',
                                          style: TextStyle(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 5, right: 5),
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(0, 0, 0, 0.20),
                                        border: Border.all(
                                            color: Color.fromRGBO(
                                                255, 255, 255, .20),
                                            width: 1.5),
                                        borderRadius:
                                        BorderRadius.circular(45)),
                                    height: 150,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          getDay(1),
                                          style: TextStyle(
                                              color: Colors.white),
                                        ),
                                        Container(
                                            height: 40,
                                            width: 40,
                                            child: Image.asset(
                                                'assets/09d.png')),
                                        Text(
                                          '${((wather.main!.temp! - 273.15)+3).round()}°',
                                          style: TextStyle(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 5, right: 5),
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(0, 0, 0, 0.20),
                                        border: Border.all(
                                            color: Color.fromRGBO(
                                                255, 255, 255, .20),
                                            width: 1.5),
                                        borderRadius:
                                        BorderRadius.circular(45)),
                                    height: 150,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          getDay(2),
                                          style: TextStyle(
                                              color: Colors.white),
                                        ),
                                        Container(
                                            height: 40,
                                            width: 40,
                                            child: Image.asset(
                                                'assets/02d.png')),
                                        Text(
                                          '${((wather.main!.temp! - 273.15)+1).round()}°',
                                          style: TextStyle(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 5, right: 5),
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(0, 0, 0, 0.20),
                                        border: Border.all(
                                            color: Color.fromRGBO(
                                                255, 255, 255, .20),
                                            width: 1.5),
                                        borderRadius:
                                        BorderRadius.circular(45)),
                                    height: 150,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          getDay(3),
                                          style: TextStyle(
                                              color: Colors.white),
                                        ),
                                        Container(
                                            height: 40,
                                            width: 40,
                                            child: Image.asset(
                                                'assets/03d.png')),
                                        Text(
                                          '${((wather.main!.temp! - 273.15)+2).round()}°',
                                          style: TextStyle(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 5, right: 5),
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(0, 0, 0, 0.20),
                                        border: Border.all(
                                            color: Color.fromRGBO(
                                                255, 255, 255, .20),
                                            width: 1.5),
                                        borderRadius:
                                        BorderRadius.circular(45)),
                                    height: 150,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          getDay(4),
                                          style: TextStyle(
                                              color: Colors.white),
                                        ),
                                        Container(
                                            height: 40,
                                            width: 40,
                                            child: Image.asset(
                                                'assets/04d.png')),
                                        Text(
                                          '${((wather.main!.temp! - 273.15)-2).round()}°',
                                          style: TextStyle(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 5, right: 5),
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(0, 0, 0, 0.20),
                                        border: Border.all(
                                            color: Color.fromRGBO(
                                                255, 255, 255, .20),
                                            width: 1.5),
                                        borderRadius:
                                        BorderRadius.circular(45)),
                                    height: 150,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          getDay(5),
                                          style: TextStyle(
                                              color: Colors.white),
                                        ),
                                        Container(
                                            height: 40,
                                            width: 40,
                                            child: Image.asset(
                                                'assets/10d.png')),
                                        Text(
                                          '${(wather.main!.temp! - 273.15).round()}°',
                                          style: TextStyle(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 5, right: 5),
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(0, 0, 0, 0.20),
                                        border: Border.all(
                                            color: Color.fromRGBO(
                                                255, 255, 255, .20),
                                            width: 1.5),
                                        borderRadius:
                                        BorderRadius.circular(45)),
                                    height: 150,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          getDay(6),
                                          style: TextStyle(
                                              color: Colors.white),
                                        ),
                                        Container(
                                            height: 40,
                                            width: 40,
                                            child: Image.asset(
                                                'assets/11d.png')),
                                        Text(
                                          '${((wather.main!.temp! - 273.15)+1).round()}°',
                                          style: TextStyle(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String getDay(int index){
    DateTime time = DateTime.now();
    if(index!=0){
      time = time.add(Duration(days: index));
    }
    String T = DateFormat('EEE').format(time);
    return T ;
  }

  String getTime(int index) {
    DateTime time = DateTime.now();
    time = time.add(Duration(hours: index));
    int hour = time.hour ;
    if(hour<12){
      if(hour==0){
        return '12 AM' ;
      }
      return '$hour AM' ;
    }
    else{
      if(hour==12){
        return '$hour PM' ;
      }
      return '${hour-12} PM' ;
    }
  }
}
