import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
WeatherModel weathermodel =BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Text(
            BlocProvider.of<GetWeatherCubit>(context).weatherModel!.cityName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
         Text('updated at ${weathermodel.date.hour}:${weathermodel.date.minute} ', style: TextStyle(fontSize: 24)),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network("https:${weathermodel.image!}"),
             Text(
                weathermodel.temp.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
             Column(
                children: [
                  Text('Mantemp:${weathermodel.maxTemp.round()}', style: TextStyle(fontSize: 16)),
                  Text('Mintemp: ${weathermodel.minTemp.round()}', style: TextStyle(fontSize: 16)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
         Text(
            weathermodel.condition,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
        ],
      ),
    );
  }
}
