import 'dart:convert';
import 'package:http/http.dart' as http;

const apiKey = 'ce2d2d1da51eb62087ce44090961bf53';
const openWeatherApi = 'https://api.openweathermap.org/data/2.5/weather';

class NetworkHelper {
  final String urlHelper;

  NetworkHelper(this.urlHelper);

  Future getData() async {
    final url = Uri.parse(urlHelper);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;

      print(response.statusCode);
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
