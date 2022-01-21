import 'package:flutter/material.dart';
import 'package:shoes_ecommerce/screens/nav_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoes Ecommerce Mobile App UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavScreen(),
    );
  }
}
