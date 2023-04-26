abstract class Failure {
  final String errMessage;
  Failure(this.errMessage);
}

class AuthFailure extends Failure {
  AuthFailure(super.errMessage);
}

class HomeFailure extends Failure {
  HomeFailure(super.errMessage);
}
