import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
const apiKey = '8ea7e02907a3d006196a2f5d76396e9c';
const openMapURL ='https://api.openweathermap.org/data/2.5/weather';


class WeatherModel {

  Future getCityWeather(String cityName)async{

    String url = 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';
    var weatherData = await NetworkHelper(url).getData();
    return weatherData;

  }

  Future<dynamic> getLocationWeather() async{
    Location l = Location();
    await l.getCurrentLocation();

    String url = '$openMapURL?lat=${l.latitude}&lon=${l.longitude}&appid=$apiKey&units=metric';

    NetworkHelper networkHelper = NetworkHelper(url);
    var decodedData =await networkHelper.getData();

    return decodedData;
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
