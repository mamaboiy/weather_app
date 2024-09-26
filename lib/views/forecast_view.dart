import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:weather_app/constants/contant.dart';
import 'package:weather_app/view_model/forecast_vm.dart';

class ForecastView extends StatefulWidget {
  const ForecastView({super.key});

  @override
  State<ForecastView> createState() => _ForecastViewState();
}

class _ForecastViewState extends State<ForecastView> {
  ForecastVM cs = Get.find<ForecastVM>();

  @override
  void initState() {
    super.initState();
    cs.vmGetForecastData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Forecast",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Color(0xff126BB3),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 20),
          color: Colors.white,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_outlined,size: 35),
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: GetBuilder<ForecastVM>(builder: (_) {
          return cs.isLoading
              ? _loadingWidget()
              : cs.forecastData.isEmpty
              ? _noDataWidget()
              : _forecastListWidget();
        }),
      ),
    );
  }

  Widget _loadingWidget() {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.blue, // Change the color to blue
      ),
    );
  }

  Widget _noDataWidget() {
    return Center(
      child: Text(
        "No data found",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _forecastListWidget() {
    return ListView.builder(
      itemCount: cs.forecastData.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final forecast = cs.forecastData[index];
        return Card(
          elevation: 4, // Add elevation to the card
          margin: EdgeInsets.all(16), // Add margin to the card
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                "${iconStartPoint}${forecast.icon}${iconEndPoint}",
              ),
            ),
            title: Text(
              "Temperature: ${forecast.temperature}",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              Jiffy.parse("${forecast.dateTime}").format(pattern: 'MMMM do yyyy'),
              style: TextStyle(fontSize: 16),
            ),
            trailing: Text(
              Jiffy.parse("${forecast.dateTime}").format(pattern: 'h:mm:ss a'),
              style: TextStyle(fontSize: 16),
            ),
          ),
        );
      },
    );
  }
}
