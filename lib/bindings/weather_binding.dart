import 'package:get/get.dart';
import 'package:weather_app/view_model/forecast_vm.dart';
import 'package:weather_app/view_model/weather_vm.dart';

class WeatherBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(WeatherVM());
    Get.put(ForecastVM());

  }
}