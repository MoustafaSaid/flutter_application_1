import 'package:flutter/material.dart';
import 'app_config.dart';
import 'main.dart';

void main() {
  final config = AppConfig(
    environment: Environment.staging,
    appTitle: 'Flutter App (Staging)',
    apiBaseUrl: 'https://staging.api.example.com',
  );

  runApp(MyApp(config: config));
}
