// This file is used to manage user sessions to keep auth and other session related data in one place.

// Example SessionManager pattern:
// 
// class SessionManager {
//   final AuthRepository _authRepository;
//   User? _currentUser;
//   DateTime? _lastRefresh;
//   
//   bool get isLoggedIn => _currentUser != null;
//   User? get currentUser => _currentUser;
//   
//   Future<void> refreshSession() async { ... }
//   Future<void> clearSession() async { ... }
// }