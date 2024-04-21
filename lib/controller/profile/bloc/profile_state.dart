abstract class ProfileState {}

class InitProfileState extends ProfileState {}

class LoadingProfileState extends ProfileState {}

class SucessPofileState extends ProfileState {
  Map<String, dynamic> data;
  SucessPofileState(this.data);
}

class FalureProfileState extends ProfileState {}
