import 'location.dart';
import 'network.dart';
import 'package:weather_app/utilities/api_key.dart';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    GetResponse getResponse = GetResponse(
        url: '$weather_url?q=$cityName&appid=$API_KEY&units=metric');
    var weatherData = await getResponse.getData();
    return weatherData;
  }

  Future<dynamic> getLocWeather() async {
    Location location = Location();
    await location.getLocation();
    GetResponse getResponse = GetResponse(
        url:
            '$weather_url?lat=${location.latitude}&lon=${location.longitude}&appid=$API_KEY&units=metric');
    var weatherData = await getResponse.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔';
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
      return 'Time for shorts and 👕half-sleeves';
    } else if (temp < 10) {
      return 'You\'ll need gloves🧣 and cap🧤';
    } else {
      return 'Bring a 🧥jacket just in case';
    }
  }
}
