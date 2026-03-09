// Route constants for GoRouter and navigation
// Update this file whenever you add or remove a route in the app.
// For dynamic routes with parameters, only define the static prefix here.

class RouterConstants {
  //==================================//
  //=========== Main routes ==========//
  static const String home = '/home';
  
  // Add more routes as the app grows:
  // static const String settings = '/settings';
  // static const String profile = '/profile';
  
  //==================================//
  //=========== Sub Routes ===========//
  // Example subroutes:
  // static const String settingsAccount = '/settings/account';
  // static const String settingsNotifications = '/settings/notifications';

  //=============================================//
  //=========== Router Checking Lists ===========//
  static const List<String> allRoutes = [
    home,
  ];


  // Optional: Dynamic routes with path parameters just list the static prefix
  static const List<String> allDynamicRoutes = [
    // Example: userDetail ('/user/detail'),   <- Matches /user/detail/:userId
  ];
}
