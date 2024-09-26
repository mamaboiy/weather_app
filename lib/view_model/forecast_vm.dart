import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/models/forcast_model.dart';
import 'package:weather_app/services/http_services.dart';
class ForecastVM extends GetxController {
  bool isLoading = false;
  List<ForecastModel> forecastData = [];

  vmGetForecastData() async {
    try {
      isLoading = true;
      update();
      forecastData = await HttpServices().fetchForecastData();
      update();
      isLoading = false;
      update();
    }catch(e) {
      print(e);
      return [];
    }
  }
}