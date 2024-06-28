import 'dart:convert';
import 'package:http/http.dart' as http;

const String apiKey = '117912ed472d4c5daa041347242806';
const String baseUrl = 'https://api.weatherapi.com/v1/current.json';
const String location = 'Santo Domingo';

class ClimaApiService {
  static Future<Map<String, dynamic>> fetchWeather() async {
    final url = Uri.parse('$baseUrl?key=$apiKey&q=$location&lang=es');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}