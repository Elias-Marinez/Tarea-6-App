import 'dart:convert';
import 'package:http/http.dart' as http;

class UniversidadApiService {
  static Future<List<dynamic>> fetchUniversities(String country) async {
    final url = Uri.parse('http://universities.hipolabs.com/search?country=$country');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load universities');
    }
  }
}