import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Model/wather/wather.dart';

class searchResult extends StatefulWidget {
  final Wather cityWather ;
  final String Scity ;
  const searchResult({super.key, required this.cityWather, required this.Scity});

  @override
  State<searchResult> createState() => _searchResultState();
}

class _searchResultState extends State<searchResult> {


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
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(72, 49, 157, 0),
                Color.fromRGBO(72, 49, 157, .50),
                Color.fromRGBO(72, 49, 157, 0),
              ]),
        ),
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        '${widget.Scity}, ${widget.cityWather.sys!.country}',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        '${(widget.cityWather.main!.temp! - 273.15).round()}° | ${widget.cityWather.weather![0].description}',
                        style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10,),
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
                                        '${widget.cityWather.clouds!.all} %',
                                        style: TextStyle(fontSize: 30,color: Colors.white),
                                      ),
                                      Text('${widget.cityWather.weather![0].description}',style: TextStyle(color: Colors.white),),
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
                                        getTime(widget.cityWather.sys!.sunrise!),
                                        style: TextStyle(fontSize: 30,color: Colors.white),
                                      ),
                                      Text('Sunset: ${getTime(widget.cityWather.sys!.sunset!)}',style: TextStyle(color: Colors.white),),
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
                                        '${widget.cityWather.wind!.speed}',
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
                                        '${(widget.cityWather.main!.feelsLike! - 273.15).round()}°',
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
                                        '${widget.cityWather.main!.humidity}%',
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
                                        '${widget.cityWather.visibility!/1000} KM',
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
                                        '${widget.cityWather.main!.pressure} hpa',
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
      ),
    );
  }
}
