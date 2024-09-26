import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/bindings/weather_binding.dart';
import 'package:weather_app/views/forecast_view.dart';
import 'package:weather_app/views/weather_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/weather',
      getPages: [
        GetPage(
            name: '/weather',
            page: () => WeatherView(),
            binding: WeatherBindings()
        ),

        GetPage(
          name: '/forecast',
          page: () => ForecastView(),
          binding: WeatherBindings(),
        ),
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
