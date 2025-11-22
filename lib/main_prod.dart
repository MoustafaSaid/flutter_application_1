import 'package:flutter/material.dart';
import 'app_config.dart';
import 'main.dart';

void main() {
  final config = AppConfig(
    environment: Environment.prod,
    appTitle: 'Flutter App',
    apiBaseUrl: 'https://api.example.com',
  );

  runApp(MyApp(config: config));
}
