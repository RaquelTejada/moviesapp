import 'package:flutter/material.dart';
import 'package:namer_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hola Mundo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 90, 90, 90)),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Hola Mundo'),
    );
  }
}
