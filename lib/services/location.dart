import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Future getCurrentLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {}
    try {
      Position location = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      latitude = location.latitude;
      longitude = location.longitude;
      print(location);
    } catch (error) {
      print(error);
    }
  }
}
