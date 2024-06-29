import 'dart:convert';
import 'package:http/http.dart' as http;

class NoticiasApiService {
  static Future<List<dynamic>> fetchNews({int perPage = 3}) async {
    //final url = Uri.parse('https://mescyt.gob.do/wp-json/wp/v2/posts');
    final url = Uri.https('mescyt.gob.do', '/wp-json/wp/v2/posts', {'per_page': '$perPage'});
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load news');
    }
  }
}