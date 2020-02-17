part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoading extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherError extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoaded extends WeatherState {
  final Weather weather;

  const WeatherLoaded({@required this.weather});

  @override
  List<Object> get props => [weather];
}

class WeatherDetailLoaded extends WeatherState {
  final Weather weather;

  const WeatherDetailLoaded({@required this.weather});

  @override
  List<Object> get props => [weather];
}
