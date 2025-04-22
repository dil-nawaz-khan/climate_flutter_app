import 'package:climate_flutter_app/services/networking.dart';
import 'package:climate_flutter_app/services/location.dart';

const apiKey = '49e87994dd9d5eb38a6a889152e20a01';

class WeatherModel {
  Future getLocationWeather() async {
    try {
      Location location = Location();
      await location.getCurrentLocation();

      NetworkHelper networkHelper = NetworkHelper(
        authority: 'api.openweathermap.org',
        unencodedPath: '/data/2.5/weather',
        queryParameters: {
          'lat': location.latitude.toString(),
          'lon': location.longitude.toString(),
          'appid': apiKey,
          'units': 'metric',
        },
      );

      var weatherData = await networkHelper.getData();
      return weatherData;
    } catch (e, stacktrace) {
      print('⚠️ Error in getLocationWeather: $e');
      print('🧵 Stacktrace: $stacktrace');
      return null; // Or handle fallback logic
    }
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
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
