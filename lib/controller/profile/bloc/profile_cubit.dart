import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive/controller/profile/bloc/profile_state.dart';
import 'package:responsive/controller/profile/repo/profile_repo_imple.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileRepoImpl profileRepoImpl;

  ProfileCubit(this.profileRepoImpl) : super(InitProfileState());

  Future<void> getProfileDate() async {
    emit(LoadingProfileState());
    var respose = await profileRepoImpl.getProfileDate();

    respose.fold((falure) => emit(FalureProfileState()), (data) {
      emit(SucessPofileState(data));
    });
  }
}
