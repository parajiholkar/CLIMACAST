import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather/Controller/globelController.dart';
import 'package:weather/Pages/savedLocations.dart';
import 'package:weather/Pages/weatherHome.dart';
import 'package:weather/Pages/weatherInfo.dart';

import '../Widgets/Skaletonwiget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  int selectedIndex = 0;

  @override
  void initState() {
    checkConnetction();
    super.initState();
  }

  checkConnetction() async {
    bool internetConnetction = await InternetConnectionChecker().hasConnection;
    if (!internetConnetction) {
      showDialogBox();
    }
  }

  void showDialogBox() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              icon: Icon(Icons.signal_wifi_connected_no_internet_4_outlined),
              title:
                  Text('No Internet Connection', textAlign: TextAlign.center),
              content: Text(
                'Please Check Your Internet Connectivity',
                textAlign: TextAlign.center,
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: () async {
                      bool internetConnetction =
                          await InternetConnectionChecker().hasConnection;
                      if (!internetConnetction) {
                        showDialogBox();
                      }
                      globalController.getLocation();
                      Navigator.pop(context, 'cancel');
                    },
                    child: const Text('OK'))
              ],
            ));
  }

  Widget skaletonAnimation() {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 0.5,
          margin: EdgeInsets.only(top: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 200, height: 30, child: skaletonWidget()),
              SizedBox(
                height: 10,
              ),
              Container(width: 200, height: 70, child: skaletonWidget()),
              SizedBox(
                height: 10,
              ),
              Container(width: 200, height: 15, child: skaletonWidget()),
              SizedBox(
                height: 10,
              ),
              Container(width: 200, height: 15, child: skaletonWidget()),
            ],
          ),
        ),
        Container(
            child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          child: Container(
            child: Shimmer.fromColors(
              baseColor: Color.fromRGBO(0, 0, 0, 0.99),
              highlightColor: Color.fromRGBO(255, 255, 255, 0.99),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromRGBO(255, 255, 255, 0.10), width: 1.5),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45))),
                child: Column(children: [
                  SizedBox(
                    height: 5,
                  ),
                  Container(width: 70, height: 3, child: skaletonWidget()),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 150,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(height: 25, child: skaletonWidget()),
                      ),
                      Container(
                        width: 150,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(height: 25, child: skaletonWidget()),
                      ),
                    ],
                  ),
                  Container(
                    height: 2,
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(child: skaletonWidget()),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 25, left: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 2.5, right: 2.5),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45)),
                            child: Container(
                              height: 150,
                              width: 50,
                              child: skaletonWidget(),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 2.5, right: 2.5),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45)),
                            child: Container(
                              height: 150,
                              width: 50,
                              child: skaletonWidget(),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 2.5, right: 2.5),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45)),
                            child: Container(
                              height: 150,
                              width: 50,
                              child: skaletonWidget(),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 2.5, right: 2.5),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45)),
                            child: Container(
                              height: 150,
                              width: 50,
                              child: skaletonWidget(),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 2.5, right: 2.5),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45)),
                            child: Container(
                              height: 150,
                              width: 50,
                              child: skaletonWidget(),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 2.5, right: 2.5),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45)),
                            child: Container(
                              height: 150,
                              width: 50,
                              child: skaletonWidget(),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 2.5, right: 2.5),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45)),
                            child: Container(
                              height: 150,
                              width: 50,
                              child: skaletonWidget(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        )),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(46, 51, 90, 100),
      body: SafeArea(
        child: Obx(() => globalController.checkLoading().isTrue
            ? Center(child: skaletonAnimation())
            : _selectedPage()),
      ),
      bottomNavigationBar: Container(
        color: Color.fromRGBO(46, 51, 90, 100),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
          child: GNav(
              gap: 10,
              backgroundColor: Colors.transparent,
              color: Colors.white,
              activeColor: Colors.white,
              padding: EdgeInsets.all(10),
              tabBackgroundColor: Color.fromRGBO(0, 0, 0, 0.20),
              onTabChange: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.location_on,
                  text: 'Location',
                ),
                GButton(
                  icon: Icons.menu,
                  text: 'Weather Info',
                ),
              ]),
        ),
      ),
    );
  }

  Widget _selectedPage() {
    if (selectedIndex == 0) {
      return weatherHome();
    } else if (selectedIndex == 1) {
      return savedLocations();
    } else {
      return weatherInfo();
    }
  }
}
