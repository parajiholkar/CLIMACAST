import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Controller/globelController.dart';
import '../Model/wather/wather.dart';

class savedLocations extends StatefulWidget {
  const savedLocations({super.key});

  @override
  State<savedLocations> createState() => _savedLocationsState();
}

class _savedLocationsState extends State<savedLocations> {
  TextEditingController searchController = TextEditingController();
  final GlobalController globalController =
  Get.put(GlobalController(), permanent: true);
  late Wather wather;

  @override
  void initState() {
    wather = globalController.weatherData.value.current!.wather;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(46, 51, 90, 100),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Weather'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              Container(
                height: 40,
                padding: EdgeInsets.only(left: 25),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(72, 49, 157, .30),
                    border: Border.all(
                      color: Color.fromRGBO(255, 255, 255, .40),
                    ),
                    borderRadius: BorderRadius.circular(25)),
                child: TextField(
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          )),
                      hintText: 'search for a city',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  ClipPath(
                    clipper: CustompathCliper(),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color.fromRGBO(89, 54, 180, 100),
                            Color.fromRGBO(54, 42, 132, 100),
                          ]),
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 150,
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2.45,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${(wather.main!.temp! - 273.15).round()}°',
                                  style: TextStyle(
                                      fontSize: 50, color: Colors.white),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${DateFormat('yMMMMd').format(DateTime.now())}',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                ),
                                Text(
                                  '${globalController.getCity()}, ${wather.sys!.country}',
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2.45,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    height: 130,
                                    child: Image.asset(
                                        'assets/Moon_cloud_fast_wind.png')),
                                Text(
                                  wather.weather![0].description.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  ClipPath(
                    clipper: CustompathCliper(),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color.fromRGBO(89, 54, 180, 100),
                            Color.fromRGBO(54, 42, 132, 100),
                          ]),
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 150,
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2.45,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${((wather.main!.temp! - 273.15)+2).round()}°',
                                  style: TextStyle(
                                      fontSize: 50, color: Colors.white),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${DateFormat('yMMMMd').format(DateTime.now())}',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                ),
                                Text(
                                  '${'Mumbai'}, ${wather.sys!.country}',
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2.45,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    height: 130,
                                    child: Image.asset(
                                        'assets/Moon_cloud_fast_wind.png')),
                                Text(
                                  wather.weather![0].description.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustompathCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();
    path.lineTo(0, h);
    path.lineTo(w, h);
    path.lineTo(w, h - 50);
    path.quadraticBezierTo(w, h - 50, w * 0.2, 0);
    path.lineTo(60, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
