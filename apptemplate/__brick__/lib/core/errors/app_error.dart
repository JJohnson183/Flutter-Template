// Template for all error types
abstract class AppError {
  final Object code;
  final String? message;
  final Map<String, dynamic>? context;

  const AppError(this.code, {this.message, this.context});
}