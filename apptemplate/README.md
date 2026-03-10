# apptemplate

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

A Mason brick that generates a Flutter app with Clean Architecture, MVVM, and common utilities pre-configured.

## Variables

| Variable | Description | Example |
|----------|-------------|---------|
| `app_name` | App name in snake_case | `my_app` |
| `org` | Reverse domain org identifier | `com.johndoe` |

## What's Generated

- Clean Architecture folder structure (`core`, `data`, `domain`, `features`)
- **Dependency Injection** - GetIt for service location
- **Type-Safe Routing** - go_router with centralized route constants
- **Error Handling** - Result type for safe error propagation
- **Global UI States** - Loading overlay and snackbar notifications
- **BaseViewModel** - Foundation for state management with ChangeNotifier