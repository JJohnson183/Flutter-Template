# {{app_name}}

A Flutter application template using Clean Architecture with MVVM pattern.

## Features
- **Clean Architecture** - Separation of concerns with domain/data/features layers
- **Dependency Injection** - GetIt for service location
- **Type-Safe Routing** - go_router with centralized route constants
- **Error Handling** - Result type for safe error propagation
- **Global UI States** - Loading overlay and snackbar notifications
- **BaseViewModel** - Foundation for state management with ChangeNotifier

## Project Structure
```
lib/
  main.dart
  app/
    app.dart          # Root widget and MaterialApp setup
    di.dart           # Dependency injection setup
    router.dart       # App routing configuration (go_router)
    theme/            # App theme and styling
  core/
    constants/        # App-wide constants
    errors/           # Error handling and exceptions
    models/           # App-wide models and args
    session/          # Session state management
    utils/            # Pure logic helpers
    viewmodels/       # Globally shared viewmodels (ex. BaseViewModel)
    widgets/          # Globally shared widgets (GlobalSnackbar, GlobalLoader)
  data/
    models/           # Models of raw external data models (ex. Firestore, API)
    repositories/     # Abstract repository implementations
    services/         # External services (ex. APIs, Firebase, sqlite)
  domain/
    entities/         # App use specific models 
    repositories/     # Repository abstractions
    value_objects/    # Custom validated types (ex. EmailAddress, Password)
  features/           # Main user interfaces (view / viewmodel / widgets)
```

## Getting Started
```bash
flutter pub get
```

To initialize a new git repository:
```bash
git init
```

## Dependencies
- go_router: For navigation and routing 
- get_it: For dependency injection