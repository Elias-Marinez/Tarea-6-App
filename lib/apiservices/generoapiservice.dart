import 'package:http/http.dart' as http;
import 'dart:convert';

class GeneroApiService {
  Future<Map<String, dynamic>> fetchGender(String name) async {
    final response = await http.get(Uri.parse('https://api.genderize.io/?name=$name'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load gender data');
    }
  }
}