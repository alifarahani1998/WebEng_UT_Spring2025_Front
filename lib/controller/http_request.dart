import 'dart:convert';
import 'package:flutter_application_test/model/joke_model.dart';
import 'package:flutter_application_test/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HTTPRequest {

  // Create an instance of database and use it to save/load in file
  SharedPreferences? sharedPreferences;

  // Remove async/await to see UI freezes when async is not used 
  static Future<Joke> fetchJoke() async {
    final response = await http.get(Uri.parse(jokeUrl));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      // Save token in database
      // await sharedPreferences.setString('TOKEN', jsonDecode(response.body)['token']);

      // Load token from database
      // sharedPreferences.getString('TOKEN');

      return Joke.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load data from server');
    }
  }

  static Future<String> sendMobile(String mobile) async {
    var result = await http.post(
      Uri.parse(sendMobileUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        // Use this to add token in API
        // 'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, String>{'mobile': mobile}),
    );
    return result.body;
  }
}
