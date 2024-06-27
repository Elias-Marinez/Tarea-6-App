import 'package:http/http.dart' as http;
import 'dart:convert';
import 'generoapiservice.dart';

class EdadApiService {
  final GeneroApiService _generoApiService = GeneroApiService();

  Future<Map<String, dynamic>> fetchAge(String name) async {
    final response = await http.get(Uri.parse('https://api.agify.io/?name=$name'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load age data');
    }
  }

  Future<Map<String, dynamic>> fetchGender(String name) {
    return _generoApiService.fetchGender(name);
  }
}