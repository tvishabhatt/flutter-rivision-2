import 'package:flutter/material.dart';
import 'package:new_api_project_2/View/CategoryPageHttp.dart';
import 'package:new_api_project_2/View/DeshBord.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:DeshBord(),
    );
  }
}


