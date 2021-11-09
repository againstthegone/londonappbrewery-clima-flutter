import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  int status = 0;
  var condition;
  var temp;
  var cityName;

  Future<void> getLocationData() async {
    WeatherModel model = WeatherModel();
    dynamic weather = await model.getLocationWeather();

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => LocationScreen(weather)));
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(color: Colors.white, size: 100),
      ),
    );
  }
}
