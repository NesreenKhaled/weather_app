import 'package:flutter/material.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/get_weather_cubit/get_weather_cubit.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: CustomMaterialApp(),
          );
        }
}

class CustomMaterialApp extends StatelessWidget {
  const CustomMaterialApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, Weatherstate>(
      builder: (context, state) {
     return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: getThemeColor(
            BlocProvider.of<GetWeatherCubit>(context).weatherModel?.condition,
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: getThemeColor(
              BlocProvider.of<GetWeatherCubit>(context).weatherModel?.condition,
            ),
          ),
        ),
        home: const HomeView(),
      );}
    );
  }
}

MaterialColor getThemeColor(String? condition)  {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.orange;

    case 'Partly cloudy':
    case 'Patchy rain nearby':
    case 'Cloudy':
    case 'Overcast':
      return Colors.blueGrey;

    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
      return Colors.grey;

    case 'Patchy rain possible':
    case 'Patchy light drizzle':
    case 'Light drizzle':
    case 'Light rain':
    case 'Patchy light rain':
    case 'Light rain shower':
      return Colors.lightBlue;

    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
      return Colors.blue;

    case 'Patchy snow possible':
    case 'Patchy light snow':
    case 'Light snow':
    case 'Light snow showers':
      return Colors.cyan;

    case 'Patchy moderate snow':
    case 'Moderate snow':
    case 'Patchy heavy snow':
    case 'Heavy snow':
    case 'Moderate or heavy snow showers':
      return Colors.indigo;

    case 'Patchy sleet possible':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
      return Colors.teal;

    case 'Patchy freezing drizzle possible':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
    case 'Blowing snow':
    case 'Blizzard':
      return Colors.lightBlue;

    case 'Ice pellets':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.deepOrange;

    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.deepPurple;

    default:
      return Colors.blue;
  }
}
