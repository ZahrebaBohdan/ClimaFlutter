import 'package:flutter/material.dart';

import 'location.dart';
import 'networking.dart';

const apiKey = '1a0382a014f3edb48b8eeb66d1c9f9bc';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }

  String getBackground(int condition) {
    if (condition < 300) {
      return 'images/groza.jpg';
    } else if (condition < 400) {
      return 'images/drizzle.jpg';
    } else if (condition < 600) {
      return 'images/rain.jpg';
    } else if (condition < 700) {
      return 'images/snow.jpg';
    } else if (condition < 800) {
      return 'images/fog.jpg';
    } else if (condition == 800) {
      return 'images/sunny.webp';
    } else if (condition <= 804) {
      return 'images/cloudy.webp';
    } else {
      return 'images/loaction_background.jpg';
    }
  }
}


