import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl = "http://ahamd.kesug.com/";

  Future<List<dynamic>> fetchRecipes() async {
    var response = await http.get(Uri.parse(baseUrl + 'recipes.php'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}
