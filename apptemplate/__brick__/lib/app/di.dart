// Used for dependency injection

import 'package:get_it/get_it.dart';
import 'package:{{app_name}}/core/widgets/global_loader.dart';

final GetIt getIt = GetIt.instance;

//================ Core Helper Registrations ================//
// Used to register core helpers that are used across the app
void _registerCoreHelpers() {
  // Global Loader for app-wide loading states
  getIt.registerLazySingleton<GlobalLoaderManager>(() => GlobalLoaderManager());
  
  // Example: getIt.registerLazySingleton<ConnectivityService>(() => ConnectivityService());
}

//================ Service Registrations ================//
// Used to register backend services (Firebase, Supabase, sqlite, etc.)
void _registerServices() {
  // Example:
  // getIt.registerLazySingleton<AuthService>(() => FirebaseAuthService());
  // getIt.registerLazySingleton<DatabaseService>(() => FirebaseDatabaseService());
  
  // Async initialization example:
  // getIt.registerSingletonAsync<LocalPreferencesService>(() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return LocalPreferencesService(prefs);
  // });
}

//================ Repository Registrations ================//
// Used to register repositories that use services
void _registerRepositories() {
  // Example: 
  // getIt.registerLazySingleton<AuthRepository>(
  //   () => AuthRepositoryImpl(getIt<AuthService>()),
  // );
}

//================ ViewModel Registrations ================//
// Used to register ViewModels that can use repositories. Created once and shared
void _registerViewModels() {
  // Example:
  // getIt.registerLazySingleton<HomeViewModel>(
  //   () => HomeViewModel(getIt<UserRepository>()),
  // );
}


//================ Setup ================//
/// Call this once at startup to initialize all dependencies
Future<void> setupDependencies() async {
  _registerCoreHelpers();
  _registerServices();
  
  // Wait for any async singletons to be ready before proceeding
  // await getIt.allReady();
  
  _registerRepositories();
  _registerViewModels();
}

/// Used for testing - resets all registered dependencies
Future<void> resetDependencies() async {
  await getIt.reset(dispose: true);
}