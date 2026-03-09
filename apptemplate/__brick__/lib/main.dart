import 'package:flutter/material.dart';
import 'package:{{app_name}}/app/app.dart';
import 'package:{{app_name}}/app/di.dart';

void main() async {
  // To make sure Flutter is ready to work with the device before setting things up
  WidgetsFlutterBinding.ensureInitialized();

  // Setup Dependency Injection
  await setupDependencies();

  runApp(const App());
}
