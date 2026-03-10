# 0.1.0

- Initial release
- Clean Architecture folder structure with `core`, `data`, `domain`, and `features` layers (MVVM)
- Routing setup using go_router with route constants
- Dependency injection setup using GetIt
- `Result<T, E>` type for handling success and failure without exceptions
- `AppError` base class for consistent error structure across the app
- `BaseViewModel` with built-in loading state, error state, and safe notification scheduling
- `GlobalSnackbar` for showing snackbars from anywhere without needing a context
- `GlobalLoader` overlay for app-wide loading indication
- `SessionManager` placeholder for managing session states such as auth
- `HomeView` as the initial route placeholder