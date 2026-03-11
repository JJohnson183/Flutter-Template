# Flutter App Template

A Flutter template for quickly scaffolding new apps with a consistent and already understood structure. Uses [Mason](https://pub.dev/packages/mason_cli) for project generation.

## Prerequisites

Mason must be installed:
```bash
dart pub global activate mason_cli
```

## Bricks

### apptemplate
The core Flutter app template. Generates a full project with Clean Architecture, MVVM, routing, dependency injection, and shared utilities pre-configured.

**Clone the repo:**
```bash
git clone https://github.com/JJohnson183/Flutter-Template.git
cd Flutter-Template
```

**Install globally:**
```bash
mason add -g apptemplate --path ./apptemplate
```

**Generate a new app:**
```bash
mason make apptemplate --output-dir ../your_app_name
```

You will be prompted for:
- `app_name` - snake_case app name (e.g. `my_app`)
- `org` - reverse domain org identifier (e.g. `com.johndoe`)

**After generation:**
```bash
cd ../your_app_name
flutter pub get
```

> **Note:** Once the [Mason git hook bug on Windows](https://github.com/felangel/mason/issues/1573) is resolved, installation will be possible directly from the git URL without cloning.
