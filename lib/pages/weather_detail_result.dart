import 'package:flutter/widgets.dart';
import 'package:flutter_fake_with_detail/data/model/weather.dart';

class WeatherDetailResult extends StatelessWidget {
  final Weather weather;
  WeatherDetailResult({@required this.weather, Key key}) : super(key: key);

  final TextStyle textStyle = TextStyle(fontSize: 34);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              weather.cityName,
              style: textStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${weather.temperatureCelsius.toStringAsFixed(2)}º",
              style: textStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${weather.temperatureFarenheit.toStringAsFixed(2)}º",
              style: textStyle,
            ),
          ),
        ],
      ),
    );
  }
}
