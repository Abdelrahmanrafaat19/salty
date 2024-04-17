abstract class LoginState {}

class LoginInitState extends LoginState {}

class LoginSuccesState extends LoginState {
  Map<String, dynamic> data;
  LoginSuccesState(this.data);
}

class LoginLoadingState extends LoginState {}

class LoginFailureState extends LoginState {
  String message;
  LoginFailureState(this.message);
}
