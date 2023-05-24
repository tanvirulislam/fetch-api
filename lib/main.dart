import 'package:api_provider_list_json/providers/user_provider.dart';
import 'package:api_provider_list_json/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Api Provider',
        theme: ThemeData(primarySwatch: Colors.purple),
        // home: SingleUser(),
        home: Home(),
      ),
    );
  }
}
