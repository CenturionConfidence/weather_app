import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

class WeatherModel {
  Future getCity(String cityName) async {
    NetworkHelper networkHelper =
        NetworkHelper('$openWeatherApi?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  Future getWeatherData() async {
    Location location = Location();

    await location.getCurrentLocation();

    NetworkHelper networkHelper =
        NetworkHelper('$openWeatherApi?q=London&appid=$apiKey&units=metric');

    return networkHelper;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s Sunny time ';
    } else if (temp > 20) {
      return 'Time for shorts and Light Clothes';
    } else if (temp < 10) {
      return 'You\'ll need Thick Gloves';
    } else {
      return 'Bring a Jacket just in case';
    }
  }
}
