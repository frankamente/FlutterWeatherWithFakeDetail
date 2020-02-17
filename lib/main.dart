import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fake_with_detail/bloc/weather_bloc.dart';
import 'package:flutter_fake_with_detail/pages/weather_search_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: BlocProvider(
          create: (context) => WeatherBloc(),
          child: WeatherSearchPage(),
        ),
      ),
    );
  }
}
