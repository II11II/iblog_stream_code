abstract class Failure {
  final String message;

  const Failure(this.message);
}

class LocalFailure extends Failure {
  const LocalFailure(String message) : super(message);
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

