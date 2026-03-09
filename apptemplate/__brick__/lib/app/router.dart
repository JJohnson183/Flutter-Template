// Handles routing and navigation for the app, defines routes and navigation logic

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:{{app_name}}/core/constants/router_constants.dart';
import 'package:{{app_name}}/features/home/view/home_view.dart';


final appRouter = GoRouter(
  initialLocation: RouterConstants.home,

  // Used for invalid route handling. If the route does not start with any known route and is not in the 
  // GoRouter at all, redirect to /not-found
   redirect: (context, state) {
    final path = state.uri.path;
    
    // Check for exact matches
    if (RouterConstants.allRoutes.contains(path)) return null;

    // Check for dynamic route matches. Turn each dynamic route into a regex pattern to match against.
    final validPatterns = RouterConstants.allDynamicRoutes.map((route) {
      return RegExp('^$route/[^/]+\$');
    }).toList();
    final isKnown = validPatterns.any((pattern) => pattern.hasMatch(path));
  
    if (!isKnown) {return '/not-found';}
    return null;
  },


  routes: [
    GoRoute(
      path: RouterConstants.home,
      builder: (context, state) => const HomeView(),
    ),

    // Add more routes here as the app grows:
    // GoRoute(
    //   path: RouterConstants.settings,
    //   builder: (context, state) => const SettingsView(),
    // ),
    
    // Example with subroutes:
    // GoRoute(
    //   path: '/feature',
    //   redirect: (context, state) {
    //     if (state.fullPath == '/feature') return '/feature/browse';
    //     return null;
    //   },
    //   routes: [
    //     GoRoute(path: 'browse', builder: (_, __) => const FeatureBrowseView()),
    //     GoRoute(path: 'detail', builder: (_, __) => const FeatureDetailView()),
    //   ],
    // ),

    //============= Helper Routes ===============//
    GoRoute(
      path: '/not-found',
      builder: (context, state) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Desired route not found, redirecting to home."),
              duration: Duration(seconds: 3),
              dismissDirection: DismissDirection.horizontal,
            ),
          );
          GoRouter.of(context).go(RouterConstants.home);
        });
        return const SizedBox.shrink();
      },
    ),
  ],
);