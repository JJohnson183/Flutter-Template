// Used as main entry for the app, wraps the app with necessary providers and sets up routing

import 'package:flutter/material.dart';
import 'router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router( // App container that has the GoRouter built in for navigation
      title: '{{app_name}}',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      routerConfig: appRouter, // Imported from the router.dart file
      builder: (context, child) {
        return Stack(
          children: [
            child!,
          ],
        );
      },

      // Defines which languages the app supports
      supportedLocales: const [
        Locale('en'),
      ],
    );
  }
}