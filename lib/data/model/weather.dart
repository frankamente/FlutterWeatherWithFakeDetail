import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Weather implements Equatable {
  final String cityName;
  final double temperatureCelsius;
  final double temperatureFarenheit;

  const Weather(
      {@required this.cityName,
      @required this.temperatureCelsius,
      this.temperatureFarenheit});

  @override
  List<Object> get props => [
        this.cityName,
        this.temperatureCelsius,
        this.temperatureFarenheit,
      ];

  @override
  bool get stringify => true;
}
