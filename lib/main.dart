import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text(
            'Weather Forecast',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.red,
          actions: <Widget>[  

          ],
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: _buildBody(),
      ),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          _citySearch(),
          const Divider(),
          _cityDetail(),
          const Divider(),
          _temperatureDetail(),
          const Divider(),
          _extraWeatherDetail(),
          const Divider(height: 30,),
          const Text(
            "7-DAY WEATHER FORECAST",
            style: TextStyle(fontSize: 18,color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 150,
            child: SevenDayForecast(),
          ),
        ],
      ),
    ),
  );
}

Row _citySearch() {
  return const Row(
    children: <Widget>[
      Icon(
        Icons.search,
        color: Colors.white
        ),
      SizedBox(
        width: 5,
      ),
      Text(
        "Enter City Name",
        style: TextStyle(fontSize: 16,color: Colors.white),),
    ],
  );
}

Column _cityDetail() {
  return Column(
    children: const <Widget>[
      Text(
        "Murmansk Oblast,RU",
        style: TextStyle(fontSize: 28,color: Colors.white),
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        "Friday, Mar 20, 2020",
        style: TextStyle(fontSize: 20,color: Colors.white),
      ),
    ],
  );
}

Row _temperatureDetail() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Icon(
        Icons.sunny,
        size: 100,
        color: Colors.white,
      ),
      Column(
        children: const [
          Text(
            "14°C",
            style: TextStyle(fontSize: 50,color: Colors.white),
          ),
          Text(
            "LIGHT SNOW",
            style: TextStyle(fontSize: 15,color: Colors.white),
          ),
        ],
      ),
    ],
  );
}

Row _extraWeatherDetail() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        children: const [
          Icon(
            Icons.water_drop,
            size: 30,
            color: Colors.white,

          ),
          Text(
            "5",
            style: TextStyle(fontSize: 25,color: Colors.white),
          ),
          Text(
            "Km/h",
            style: TextStyle(fontSize: 15,color: Colors.white),
          ),
        ],
      ),
      Column(
        children: const [
          Icon(
            Icons.water_drop,
            size: 30,
            color: Colors.white,

          ),
          Text(
            "3",
            style: TextStyle(fontSize: 25,color: Colors.white),
          ),
          Text(
            "%",
            style: TextStyle(fontSize: 15,color: Colors.white),
          ),
        ],
      ),
      Column(
        children: const [
          Icon(
            Icons.water_drop,
            size: 30,
           color: Colors.white,

          ),
          Text(
            "20",
            style: TextStyle(fontSize: 25,color: Colors.white),
          ),
          Text(
            "%",
            style: TextStyle(fontSize: 15,color: Colors.white),
          ),
        ],
      ),
    ],
  );
}

class SevenDayForecast extends StatelessWidget {
  const SevenDayForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return _sevenDayForecast();
  }
}

Widget _sevenDayForecast() {
  final List<String> items =
      List<String>.generate(7, (index) => "Weeks $index");
  final List<String>  intTemperature = List<String>.generate(7, (index) =>  Random().nextInt(30).toString());
  return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemExtent: 130,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          color: Color.fromARGB(169, 255, 255, 255),
          child: Column(children: [
            const SizedBox(height: 8),
            Text(items[index], style: const TextStyle(fontSize: 20, color: Colors.white),),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${intTemperature[index]}°C ', style: const TextStyle(fontSize: 25, color: Colors.white),),
                const Icon(Icons.sunny, size: 30, color: Colors.white,),
              ],
            )
          ]),
        );
      });
}