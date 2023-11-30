
import 'package:flutter/material.dart';
import 'package:prova_flutter/information_capture_screen.dart';
import 'package:prova_flutter/login_screen.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}


void main(){
  runApp(const MyApp());
}
