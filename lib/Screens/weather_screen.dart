import 'package:flutter/material.dart';
import 'package:projects_flutter/data/http_helper.dart';
import 'package:projects_flutter/data/weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController txtPlace = TextEditingController();
  Weather result = Weather('', '', 0, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: txtPlace,
                  decoration: InputDecoration(
                      hintText: 'Enter city name',
                      suffixIcon: IconButton(
                          onPressed: getData, icon: const Icon(Icons.search))),

                ),
               
              ),
               weatherRow('place',result.name),
               weatherRow('Description', result.description),
               weatherRow('Temperature', result.temperature.toString()),
               weatherRow('Pressure', result.pressure.toString()),
              weatherRow('Percived', result.percived.toString()),
              weatherRow('Humidity', result.humidity.toString()),

            ]
            )
            )
            );
  }

  Future getData() async {
    HttpHelper helper = HttpHelper();
    result = await helper.getWeather(txtPlace.text);
    setState(() {});
  }

  Widget weatherRow(String label, String value) {
    Widget row = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style:
                  TextStyle(fontSize: 20, color: Theme.of(context).hintColor),
            ),
            flex: 3,
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                  fontSize: 20, color: Theme.of(context).primaryColor),
            ),
            flex: 4,
          ),
        ],
      ),
    );
    return row;
  }
}
