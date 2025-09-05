import 'package:dio/dio.dart';

import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'e2a9ef3b34b94c5ca1e204122250608';
  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1',
      );
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final errorMessage =
          e.response?.data['error']['message'] ?? 'An error occurred';

      throw Exception(errorMessage);
    }
    // في حالة اي اكسبشن غير ال dio
    catch (e) {
      throw Exception('An unexpected error occurred');
    }
  }
}
