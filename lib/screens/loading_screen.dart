import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> {
  Future<void> getLocationData() async {
    Location location = Location();

     await location.getCurrentLocation();
    

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherApi?q=London&appid=$apiKey&units=metric');

   var weatherData = await networkHelper.getData();
    

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: ((context) => LocationScreen(
              locationWeather: weatherData,
            )),
      ),
    );
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
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
