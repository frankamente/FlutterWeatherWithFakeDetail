import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fake_with_detail/bloc/weather_bloc.dart';
import 'package:flutter_fake_with_detail/data/model/weather.dart';
import 'package:flutter_fake_with_detail/pages/search_input.dart';
import 'package:flutter_fake_with_detail/pages/weather_detail_result.dart';
import 'package:flutter_fake_with_detail/pages/weather_search_result.dart';

class WeatherSearchPage extends StatelessWidget {
  const WeatherSearchPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        print(state);
        if (state is WeatherInitial) {
          return InitialState();
        } else if (state is WeatherLoading) {
          return buildLoading();
        } else if (state is WeatherLoaded) {
          return WeatherLoadedPage(weather: state.weather);
        } else if (state is WeatherDetailLoaded) {
          return WeatherDetailLoadedPage(weather: state.weather);
        }
        return InitialState();
      },
    );
  }
}

Widget buildLoading() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

class InitialState extends StatelessWidget {
  const InitialState({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[SearchInput()],
    );
  }
}

class WeatherLoadedPage extends StatelessWidget {
  final Weather weather;
  const WeatherLoadedPage({
    @required this.weather,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        WeatherSearchResult(
          weather: weather,
        ),
        FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            disabledColor: Colors.grey,
            disabledTextColor: Colors.black,
            padding: EdgeInsets.all(8.0),
            splashColor: Colors.blueAccent,
            onPressed: () => onMoreDetailClicked(context, weather),
            child: Text(
              "Flat Button",
              style: TextStyle(fontSize: 20.0),
            )),
        SearchInput()
      ],
    );
  }

  onMoreDetailClicked(BuildContext context, Weather weather) {
    WeatherBloc weatherBloc = BlocProvider.of<WeatherBloc>(context);
    weatherBloc.add(GetDetailedWeather(cityName: weather.cityName));
  }
}

class WeatherDetailLoadedPage extends StatelessWidget {
  final Weather weather;
  const WeatherDetailLoadedPage({
    @required this.weather,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        WeatherDetailResult(
          weather: weather,
        ),
        SearchInput()
      ],
    );
  }

  onMoreDetailClicked(BuildContext context, Weather weather) {
    WeatherBloc weatherBloc = BlocProvider.of<WeatherBloc>(context);
    weatherBloc.add(GetDetailedWeather(cityName: weather.cityName));
  }
}
