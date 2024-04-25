
import 'dart:convert';
import 'package:getx_api/app/models/games/games.dart';
import 'package:http/http.dart' as http;

class GameSource {
  static Future<List<Games>?> getLiveGames() async {
    String url = 'https://www.freetogame.com/api/games';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List list = jsonDecode(response.body);
        return list.map((e) => Games.fromJson(Map.from(e))).toList();
      } else {
        // Handle other HTTP status codes
        print('Failed to load live games. HTTP Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
        return null;
      }
    } catch (e) {
      // Handle other types of errors such as network errors
      print('Failed to load live games: $e');
      return null;
    }
  }
}
