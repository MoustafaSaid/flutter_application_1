import 'package:flutter/material.dart';
import 'app_config.dart';
import 'main.dart';

void main() {
  final config = AppConfig(
    environment: Environment.dev,
    appTitle: 'Flutter App (Dev)',
    apiBaseUrl: 'https://dev.api.example.com',
  );

  runApp(MyApp(config: config));
}
