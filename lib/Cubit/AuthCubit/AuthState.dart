abstract class AuthState {}

class InitialAuthState extends AuthState {}

class ChangeVisibility extends AuthState {}

class LoadingRegister extends AuthState {}

class SuccessfulRegister extends AuthState {
  final String token;

  SuccessfulRegister(this.token);
}

class ErrorRegister extends AuthState {
  final String error;

  ErrorRegister(this.error);
}

class ChangeAdmin extends AuthState {}

class LoadingLogin extends AuthState {}

class SuccessfulLogin extends AuthState {
  final String token;

  SuccessfulLogin(this.token);
}

class ErrorLogin extends AuthState {
  final String error;

  ErrorLogin(this.error);
}
