import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/view_model/weather_vm.dart';

// class WeatherView extends StatefulWidget {
//   WeatherView({super.key});
//
//   @override
//   State<WeatherView> createState() => _WeatherViewState();
// }
//
// class _WeatherViewState extends State<WeatherView> {
//   WeatherVM ms = Get.find<WeatherVM>();
//
//   @override
//   void initState() {
//     ms.vmGetWeatherData();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xff126BB3),
//         title: Text("Weather of Bhutan",
//             style: TextStyle(
//                 fontSize: 25,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold)),
//         centerTitle: true,
//       ),
//       body: GetBuilder<WeatherVM>(builder: (_) {
//         return customView();
//       }),
//     );
//   }
//
//   Widget customView() {
//     if (ms.isLoading) {
//       return Center(
//         child: CircularProgressIndicator(),
//       );
//     } else if (ms.weatherData == null) {
//       return Center(
//         child: Text("No data found"),
//       );
//     } else {
//       return Container(
//         height: MediaQuery.of(context).size.height * 0.9,
//         width: double.infinity,
//         decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage('assets/image/bg.jpg'
//                 ),
//               fit: BoxFit.cover
//             )
//         ),
//         child: Column(
//           // mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height * 0.1,
//               width: double.infinity,
//               child:  Center(
//                 child: Text(
//                   'Good Morning',
//                   style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               height: 200,
//               width: 200,
//               color: Colors.brown,
//               child: Text(
//                 "${ms.weatherData!.temperature}°C",
//                 style: TextStyle(
//                     fontSize: 45,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//           ],
//         ),
//       );
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/views/forecast_view.dart';
// import 'package:weather_app/Controller/weather_vm.dart';

class WeatherView extends StatefulWidget {
  WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  WeatherVM ms = Get.find<WeatherVM>();

  @override
  void initState() {
    ms.vmGetWeatherData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff126BB3),
      appBar: AppBar(
        title: Text("Temperature",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
          centerTitle: true,
          backgroundColor: Color(0xff126BB3),
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu,size: 35),
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
      body: GetBuilder<WeatherVM>(
        builder: (_) {
          return SingleChildScrollView(child: customView());
        },
      ),

    );
  }

  Widget customView() {
    if (ms.isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (ms.weatherData == null) {
      return Center(
        child: Text("No data found"),
      );
    } else {
      return Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 80, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tuesday, 24 Sept',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Bhutan',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${ms.weatherData!.temperature}°C',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Today',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      '10:15 AM',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: 10),
                // Text(
                //   'Sunny Cloudy',
                //   style: TextStyle(
                //     fontSize: 18,
                //     color: Colors.white,
                //     fontWeight: FontWeight.normal,
                //   ),
                // ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Today',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Next 7 Days >',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xff2E303E),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.cloud, color: Colors.white, size: 40),
                          SizedBox(height: 10),
                          Text(
                            '15%',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            'Rainfall',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xff2E303E),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.bolt, color: Colors.white, size: 40),
                          SizedBox(height: 10),
                          Text(
                            '5%',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            'Thunder',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xff2E303E),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.cloud, color: Colors.white, size: 40),
                          SizedBox(height: 10),
                          Text(
                            '7 km/h',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Text(
                            'Wind',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Text(
                  'Temperature',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    temperatureCard(18, '08:00'),
                    temperatureCard(20, '09:00'),
                    temperatureCard(23, '12:00'),
                    temperatureCard(25, '15:00'),
                  ],
                ),
                SizedBox(height: 30), // Add some space
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigate to another page
                        Navigator.push(context,MaterialPageRoute(builder: (context) => ForecastView()),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xff126BB3),
                        ),
                        child: Text(
                          'Forecast Weather',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 30,
            right: 20,
            child: Container(
              height: 130,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: AssetImage('assets/image/bg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cloud, color: Colors.white, size: 60),
                    SizedBox(height: 10),
                    // Text(
                    //   '${ms.weatherData!.temperature}',
                    //   style: TextStyle(
                    //     fontSize: 22,
                    //     color: Colors.black,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),

        ],
      );
    }
  }

  Widget temperatureCard(int temp, String time) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xff2E303E),
      ),
      child: Column(
        children: [
          Text(
            '$temp°C',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Icon(
            Icons.cloud,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(height: 5),
          Text(
            time,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          ),



        ],
      ),

    );
  }
}