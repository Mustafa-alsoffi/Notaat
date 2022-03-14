abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final uId;

  LoginSuccessState(this.uId);
}

class LoginErorrState extends LoginState {
  final String erorr;

  LoginErorrState(this.erorr);
}
