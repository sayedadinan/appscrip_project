import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:appscrip_project/model/user_data.dart';

class UserService {
  final String url = 'https://jsonplaceholder.typicode.com/users';
//this funtion is workingas like fetching the data from the api
  Future<List<User>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<dynamic> data =
            json.decode(response.body); //data is returning as a list
        return data.map((json) => User.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load users: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching users: $e');
      throw Exception('Failed to load users');
    }
  }
}
