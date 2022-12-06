//Login Exceptions
class UserNotFoundAuthException implements Exception {}

class WrongPasswordAuthException implements Exception {}

//Register Exceptions
class WeakPasswordAuthException implements Exception {}

class EmailAlreadyInUseAuthException implements Exception {}

class InvalidEmailAuthException implements Exception {}

//Generic Exceptions
class GenericAuthException implements Exception {
  final dynamic msg;

  GenericAuthException({this.msg});

  @override
  String toString() {
    Object? message = msg;
    if (message == null) return "Exception";
    return "Exception: $message";
  }
}

class UserNotLoggedInAuthException implements Exception {}
