// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:api_provider_list_json/models/user_model.dart';

class UserOverview extends StatelessWidget {
  final UserModel userModel;
  UserOverview({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('User Overview')),
        body: Column(
          children: [
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ID: ' + userModel.id.toString()),
                    Text('Name: ' + userModel.name.toString()),
                    Text('Email: ' + userModel.email.toString()),
                    Text('Address: ' + userModel.address!.city.toString()),
                    Text('Phone: ' + userModel.phone.toString()),
                    Text('Company: ' + userModel.company!.name.toString()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
