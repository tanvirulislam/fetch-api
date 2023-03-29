import 'dart:convert';
import 'package:api_provider_list_json/models/user_model.dart';
import 'package:http/http.dart' as http;

// get list api

Future<List<UserModel>> getAllUser() async {
  List<UserModel> users = [];
  try {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      for (var element in json) {
        users.add(UserModel.fromJson(element));
      }
    } else {
      print('something is wrong');
    }
  } catch (e) {
    print(e.toString());
  }
  return users;
}

// get single object API

Future<UserModel?> getsingleUser() async {
  UserModel? singleUser;
  try {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body.toString());
      singleUser = UserModel.fromJson(json);
    } else {
      print('Something wrong');
    }
  } catch (e) {
    print(e.toString());
  }
  return singleUser;
}
