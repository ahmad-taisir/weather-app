import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return GetWeatherCubit();
      },
      child: Builder(
        builder:(context)=> BlocBuilder<GetWeatherCubit,WeatherState>(
          builder:(context,state) {
           return MaterialApp(
              theme: ThemeData(
                  primarySwatch: getThemeColor(
                    BlocProvider
                        .of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherCondition,
                  )
              ),
              home: const HomeView(),
            );
          },
        ),
       ),
    );

}


}


 MaterialColor getThemeColor(String? condition) {
   if(condition==null) {
     return Colors.blue;
   }

  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.orange;
    case 'Partly cloudy':
    case 'Cloudy':
    case 'Overcast':
      return Colors.grey;
    case 'Mist':
    case 'Patchy rain possible':
    case 'Patchy snow possible':
    case 'Patchy sleet possible':
    case 'Patchy freezing drizzle possible':
    case 'Thundery outbreaks possible':
    case 'Fog':
    case 'Freezing fog':
    case 'Patchy light drizzle':
    case 'Light drizzle':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
      return Colors.blue;
    case 'Blowing snow':
    case 'Blizzard':
    case 'Patchy light snow':
    case 'Light snow':
    case 'Patchy moderate snow':
    case 'Moderate snow':
    case 'Patchy heavy snow':
    case 'Heavy snow':
      return Colors.lightBlue;
    case 'Ice pellets':
      return Colors.lightGreen;
    case 'Light rain shower':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
      return Colors.indigo;
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
      return Colors.purple;
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.teal;
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
      return Colors.amber;
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.red;
    default:
      return Colors.blue;
  }
}

