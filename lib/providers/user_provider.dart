import 'package:api_provider_list_json/models/user_model.dart';
import 'package:api_provider_list_json/services/service.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  List<UserModel> users = [];
  bool loading = false;

  Future<List<UserModel>> getUser() async {
    loading = true;
    users = await getAllUser();
    loading = false;
    notifyListeners();
    return users;
  }

  UserModel? singleUser;
  getSingleUserProvider() async {
    loading = true;
    singleUser = await getsingleUser();
    loading = false;
    notifyListeners();
    // return singleUser;
  }
}
