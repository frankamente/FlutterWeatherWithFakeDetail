import 'dart:math';

import 'package:flutter_fake_with_detail/data/model/weather.dart';

abstract class WeatherRepository {
  Future<Weather> fetchWeather(String cityName);
  Future<Weather> fetchDetailedWeather(String cityName);
}

class FakeWeatherRepository extends WeatherRepository {
  double temperatureCelsius;
  double temperatureFarenheit;

  FakeWeatherRepository() {
    this.temperatureCelsius = 20 + Random().nextInt(15) + Random().nextDouble();
    this.temperatureFarenheit = temperatureCelsius * 1.8 + 32;
  }

  @override
  Future<Weather> fetchWeather(String cityName) {
    return Future.delayed(
        Duration(
          seconds: 1,
        ), () {
      if (Random().nextBool()) {
        throw new NetworkError();
      }

      return Weather(
        cityName: cityName,
        temperatureCelsius: temperatureCelsius,
      );
    });
  }

  @override
  Future<Weather> fetchDetailedWeather(String cityName) {
    return Future.delayed(
        Duration(
          seconds: 1,
        ), () {
      return Weather(
        cityName: cityName,
        temperatureCelsius: temperatureCelsius,
        temperatureFarenheit: temperatureFarenheit,
      );
    });
  }
}

class NetworkError extends Error {}
