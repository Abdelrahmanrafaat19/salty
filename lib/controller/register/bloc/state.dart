abstract class RegisterState {}

class InitState extends RegisterState {}

class LoadinRegisterState extends RegisterState {}

class SucessRegisterState extends RegisterState {
  Map<String, dynamic> data;
  SucessRegisterState(this.data);
}

class FailureRegisterState extends RegisterState {
  String massege;
  FailureRegisterState(this.massege);
}
