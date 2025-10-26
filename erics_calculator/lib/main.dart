import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(children: [Image.asset('assets/ericbg.jpg', fit: BoxFit.cover, height: double.infinity, width: double.infinity,),SafeArea(child: Text('Hello Eric!'))]),
      ),
    );
  }
}
