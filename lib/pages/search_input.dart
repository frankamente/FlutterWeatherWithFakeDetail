import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fake_with_detail/bloc/weather_bloc.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 100, left: 50, right: 50),
      child: TextField(
        onSubmitted: (value) => submitCityName(context, value),
        decoration: InputDecoration(
          hintText: "Search for a city",
          suffixIcon: Icon(
            Icons.search,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent, width: 5.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
          ),
        ),
      ),
    );
  }

  void submitCityName(BuildContext context, String cityName) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    weatherBloc.add(GetWeather(cityName: cityName));
  }
}
