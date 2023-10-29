import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Controller/globelController.dart';
import 'package:get/get.dart';

import '../Model/wather/wather.dart';

class weatherInfo extends StatefulWidget {
  const weatherInfo({super.key});

  @override
  State<weatherInfo> createState() => _weatherInfoState();
}

class _weatherInfoState extends State<weatherInfo> {
  final GlobalController globalController = Get.put(GlobalController(),permanent: true);
  late Wather wather ;

  @override
  void initState() {
    wather = globalController.weatherData.value.current!.wather ;
    super.initState();
  }

  String getTime(int timeStamp){
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp*1000);
    String T = DateFormat('jm').format(time);
    return T ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(46, 51, 90, 100),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                globalController.getCity(),
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                '${(wather.main!.temp! - 273.15).round()}° | ${wather.weather![0].description}',
                style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.fromBorderSide(BorderSide(color: Color.fromRGBO(255, 255, 255, .15),)),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(72, 49, 157, 0),
                        Color.fromRGBO(72, 49, 157, .50),
                        Color.fromRGBO(72, 49, 157, 0),
                      ]),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.horizontal_rule_rounded,color: Colors.white,),
                      SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            border: Border.all(color: Color.fromRGBO(255, 255, 255, 0.10),width: 1.5),
                            color: Color.fromRGBO(0, 0, 0, 0.30),
                            borderRadius: BorderRadius.circular(25)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Air Quality',style: TextStyle(color: Colors.grey),),
                            SizedBox(height: 8,),
                            Text('3-Low Health Risk',style: TextStyle(color: Colors.white,fontSize: 22),),
                            Container(
                              height: 3,
                              width: double.infinity,
                              margin: EdgeInsets.only(top: 12, bottom: 12),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [Colors.indigo,Colors.deepOrangeAccent]),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('See more',style: TextStyle(color: Colors.white),),
                                Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 20,)
                              ],
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2.45,
                            margin: EdgeInsets.only(left: 5, right: 5, top: 10),
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                border: Border.all(color: Color.fromRGBO(255, 255, 255, 0.10),width: 1.5),
                                color: Color.fromRGBO(0, 0, 0, 0.30),
                                borderRadius: BorderRadius.circular(25)),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.cloud,color: Colors.grey,),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('CLOUDS',style: TextStyle(color: Colors.grey),),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${wather.clouds!.all} %',
                                      style: TextStyle(fontSize: 30,color: Colors.white),
                                    ),
                                    Text('${wather.weather![0].description}',style: TextStyle(color: Colors.white),),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2.45,
                            margin: EdgeInsets.only(left: 5, right: 5, top: 10),
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                border: Border.all(color: Color.fromRGBO(255, 255, 255, 0.10),width: 1.5),
                                color: Color.fromRGBO(0, 0, 0, 0.30),
                                borderRadius: BorderRadius.circular(25)),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.sunny_snowing,color: Colors.grey),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('SUNRISE',style: TextStyle(color: Colors.grey),),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      getTime(wather.sys!.sunrise!),
                                      style: TextStyle(fontSize: 30,color: Colors.white),
                                    ),
                                    Text('Sunset: ${getTime(wather.sys!.sunset!)}',style: TextStyle(color: Colors.white),),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2.45,
                            margin: EdgeInsets.only(left: 5, right: 5, top: 8),
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                border: Border.all(color: Color.fromRGBO(255, 255, 255, 0.10),width: 1.5),
                                color: Color.fromRGBO(0, 0, 0, 0.30),
                                borderRadius: BorderRadius.circular(25)),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.wind_power_rounded,color: Colors.grey),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('WIND',style: TextStyle(color: Colors.grey),),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${wather.wind!.speed}',
                                      style: TextStyle(fontSize: 30,color: Colors.white),
                                    ),
                                    Text('m/s',style: TextStyle(color: Colors.white),),
                                  ],
                                ),
                                Container(
                                  height: 3,
                                  width: double.infinity,
                                  margin: EdgeInsets.only(top: 12, bottom: 12),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [Colors.indigo,Colors.deepOrangeAccent]),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2.45,
                            margin: EdgeInsets.only(left: 5, right: 5, top: 8),
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                border: Border.all(color: Color.fromRGBO(255, 255, 255, 0.10),width: 1.5),
                                color: Color.fromRGBO(0, 0, 0, 0.30),
                                borderRadius: BorderRadius.circular(25)),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.water_drop_rounded,color: Colors.grey,),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('RAINFALL',style: TextStyle(color: Colors.grey),),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '0.0 mm in last hour',
                                      style: TextStyle(fontSize: 20,color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text('0.0 mm expected in next 24 hour',style: TextStyle(color: Colors.white),),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2.45,
                            margin: EdgeInsets.only(left: 5, right: 5, top: 8),
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                border: Border.all(color: Color.fromRGBO(255, 255, 255, 0.10),width: 1.5),
                                color: Color.fromRGBO(0, 0, 0, 0.30),
                                borderRadius: BorderRadius.circular(25)),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.sunny,color: Colors.grey,),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('FEELSLIKE',style: TextStyle(color: Colors.grey),),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${(wather.main!.feelsLike! - 273.15).round()}°',
                                      style: TextStyle(fontSize: 30,color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text('Similar to the actual Tempreture',style: TextStyle(color: Colors.white),),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2.45,
                            margin: EdgeInsets.only(left: 5, right: 5, top: 8),
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                border: Border.all(color: Color.fromRGBO(255, 255, 255, 0.10),width: 1.5),
                                color: Color.fromRGBO(0, 0, 0, 0.30),
                                borderRadius: BorderRadius.circular(25)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.sunny,color: Colors.grey,),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('HUMIDITY',style: TextStyle(color: Colors.grey),),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${wather.main!.humidity}%',
                                      style: TextStyle(fontSize: 30,color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text('The dew point is 17 right now',style: TextStyle(color: Colors.white),),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2.45,
                            margin: EdgeInsets.only(left: 5, right: 5, top: 8),
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                border: Border.all(color: Color.fromRGBO(255, 255, 255, 0.10),width: 1.5),
                                color: Color.fromRGBO(0, 0, 0, 0.30),
                                borderRadius: BorderRadius.circular(25)),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.visibility,color: Colors.grey,),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('VISIBILITY',style: TextStyle(color: Colors.grey),),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${wather.visibility!/1000} KM',
                                      style: TextStyle(fontSize: 30,color: Colors.white,),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text('Clearly Visible, Visibility in KM',style: TextStyle(color: Colors.white),),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2.45,
                            margin: EdgeInsets.only(left: 5, right: 5, top: 8),
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                border: Border.all(color: Color.fromRGBO(255, 255, 255, 0.10),width: 1.5),
                                color: Color.fromRGBO(0, 0, 0, 0.30),
                                borderRadius: BorderRadius.circular(25)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.sunny,color: Colors.grey,),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('PRESSURE',style: TextStyle(color: Colors.grey),),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      '${wather.main!.pressure} hpa',
                                      style: TextStyle(fontSize: 30,color: Colors.white,),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text('Atmospheric Pressure',style: TextStyle(color: Colors.white),),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
