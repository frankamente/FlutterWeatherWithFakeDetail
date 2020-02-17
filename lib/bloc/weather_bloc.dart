import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_fake_with_detail/data/model/weather.dart';
import 'package:flutter_fake_with_detail/data/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherRepository repository;
  WeatherBloc() {
    this.repository = FakeWeatherRepository();
  }

  @override
  WeatherState get initialState => WeatherInitial();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is GetWeather) {
      yield WeatherLoading();
      try {
        final Weather weather = await repository.fetchWeather(event.cityName);
        yield WeatherLoaded(weather: weather);
      } catch (NetworkError) {
        yield WeatherError();
      }
    }
    if (event is GetDetailedWeather) {
      yield WeatherLoading();
      try {
        final Weather weather =
            await repository.fetchDetailedWeather(event.cityName);
        yield WeatherDetailLoaded(weather: weather);
      } catch (NetworkError) {
        yield WeatherError();
      }
    }
  }
}
