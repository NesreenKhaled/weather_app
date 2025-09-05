// polyphrism  مبدأ تعدد الاشكال لنفس الحاجة
import 'package:weather_app/models/weather_model.dart';

class Weatherstate {}
class Weatherloadedstate extends Weatherstate {
final  WeatherModel ?weatherModel;
  Weatherloadedstate(this.weatherModel);
}

class Intialstate extends Weatherstate {}

class Weatherfailurstate extends Weatherstate {}
