import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/weather_info_body.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:google_fonts/google_fonts.dart';
class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only( right: 32),
          child: Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: Center(
            child: Text(
              'Weather App',
              style: GoogleFonts.dancingScript(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return SearchView();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, Weatherstate>(
        builder: (context, state) {
          if (state is Weatherloadedstate) {
            return WeatherInfoBody();
          } else if (state is Weatherfailurstate) {
            return Center(
              child: Text(
                'Failed to load weather data. Please try again.',
                style: TextStyle(fontSize: 20),
              ),
            );
          } else {
            return NoWeatherBody();
          }
        },
      ),
    );
  }
}
