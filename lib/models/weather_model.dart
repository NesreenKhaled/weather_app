class WeatherModel {
  final String cityName;
  final DateTime date;
  final String condition;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String? image;
  WeatherModel({
    required this.cityName,
    required this.date,
    required this.condition,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    this.image,
  });
  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date:  DateTime.parse(json['current']['last_updated']),
      condition: json['forecast']['forecastday'][0]['day']['condition']['text'],
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
