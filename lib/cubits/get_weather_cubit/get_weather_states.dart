
import 'package:weather_app/models/weather_model.dart';

class WeatherState{

}

class NoWeatherState extends WeatherState{}

class WeatherLoadedState extends WeatherState{
  final WeatherModel weatherModel;

  WeatherLoadedState( this.weatherModel);
}

class WeatherFailuerState extends WeatherState{
  final String errorMessage;

  WeatherFailuerState({required this.errorMessage});
}