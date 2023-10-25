import 'package:http/http.dart' as http;
import 'dart:convert';

import 'weather.dart';

class HttpHelper {
  //https://api.openweathermap.org/data/2.5/
  //weather?q=assiut&appid=66f931fa74da4d034821775b8acfb89d
  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = '66f931fa74da4d034821775b8acfb89d';

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appId': apiKey};
    Uri uri = Uri.https(authority, path, parameters);
    http.Response result = await http.get(uri);
    Map<String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromjson(data);

    return weather;
  }
}
