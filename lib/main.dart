import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/balance.dart';
import 'screens/dashboards/dashboard.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => Balance(0),
        child: BytebankApp(),
      ),
    );

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard(),
    );
  }
}
