abstract class Failure {
  final String errMessage;
  Failure(this.errMessage);
}

class AuthFailure extends Failure {
  AuthFailure(super.errMessage);
}
