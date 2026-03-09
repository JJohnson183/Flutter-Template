import 'package:flutter/material.dart';
import 'package:{{app_name}}/app/app.dart';

void main() async {
  // To make sure Flutter is ready to work with the device before setting things up
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const App());
}
