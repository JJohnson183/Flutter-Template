// Handles success or failure outcomes for actions throughout the app.
sealed class Result<T, E> {
  const Result();

  // Check result type
  bool get isOk => this is Ok<T, E>;
  bool get isErr => this is Err<T, E>;

  // Extract value or null if not the expected type
  T? get ok => this is Ok<T, E> ? (this as Ok<T, E>).value : null;
  E? get err => this is Err<T, E> ? (this as Err<T, E>).error : null;
}

// Success case - holds the returned value
class Ok<T, E> extends Result<T, E> {
  final T value;
  const Ok(this.value);
}

// Failure case - holds the error
class Err<T, E> extends Result<T, E> {
  final E error;
  const Err(this.error);
}

// Example usage:
// Future<Result<User, AppError>> login(String email, String password) async {
//   try {
//     final user = await authService.login(email, password);
//     return Ok(user);
//   } catch (e) {
//     return Err(AppError('Login failed', message: e.toString()));
//   }
// }


