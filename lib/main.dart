import 'package:flutter/material.dart';
import 'package:bitcoin_ticket/screens/price_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bitcoin Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.lightBlue,
          secondary: Colors.green,
        ),
      ),
      home: PriceScreen(),
    );
  }
}
