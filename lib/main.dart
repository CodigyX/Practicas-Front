import 'package:flutter/material.dart';
import 'package:spendify/pallete.dart';
import 'views/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spendify',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Pallete.primary),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(), // Cambia esto a la clase LoginPage
    );
  }
}
