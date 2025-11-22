enum Environment { dev, staging, prod }

class AppConfig {
  final Environment environment;
  final String appTitle;
  final String apiBaseUrl;

  AppConfig({
    required this.environment,
    required this.appTitle,
    required this.apiBaseUrl,
  });

  bool get isDev => environment == Environment.dev;
  bool get isStaging => environment == Environment.staging;
  bool get isProd => environment == Environment.prod;
}
