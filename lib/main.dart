import 'package:flutter/material.dart';
import 'package:foodie/app/modules/menu/menu_view.dart';
import 'package:foodie/app/src/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodie',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home:  MenuView(),
    );
  }
}
