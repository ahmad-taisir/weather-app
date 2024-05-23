
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {

  const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {

   WeatherModel weatherModel=BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
     decoration:const BoxDecoration
    (gradient:LinearGradient(
       colors: [
         Colors.blue,
         Colors.orange,
       ],
       begin: Alignment.topCenter,
       end: Alignment.bottomCenter,
     ) ,),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(weatherModel.cityName,
              style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,

            ),),
            Text('update at ${weatherModel.date.hour}:${weatherModel.date.minute}',
            style:const TextStyle(
              fontSize: 20,
            ) ,
            ),
            const SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network('https:${weatherModel.image}'),
                Text(weatherModel.temp .toString(),
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Maxtemp: ${weatherModel.maxTemp.round()}'),
                    Text('Mintemp: ${weatherModel.minTemp.round()}'),
                  ],
                ),
              ],
            ),
        const SizedBox(
          height: 20,
        ),
        Text(weatherModel.weatherCondition,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]
      ),
      ),
    );

  }
}
