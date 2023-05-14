import 'dart:convert';
import 'package:http/http.dart' as http;
import '../keys.dart';
import '../models/user_model.dart';

class UserServices {

  Future<List<User>> fetchUser() async {
    http.Response response = await http.get(Uri.parse(apiKey));
    if (response.statusCode == 200) {
      List responseBody = jsonDecode(response.body);
      return responseBody
          .map((e) => User.fromJson(e))
          .toList(); 
    } else {
      throw Exception('${response.statusCode} error');
    }
  }
  
}