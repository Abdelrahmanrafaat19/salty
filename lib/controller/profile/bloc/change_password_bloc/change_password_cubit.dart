import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:responsive/controller/profile/repo/change_password_repo/change_password_Repo_imple.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ChangePasswordRepoImple _changePasswordRepoImple;
  ChangePasswordCubit(this._changePasswordRepoImple)
      : super(ChangePasswordInitial());
  Future<void> changePasswordMethod(Map<String, dynamic> data) async {
    emit(ChangePasswordIsLoading());
    var response = await _changePasswordRepoImple.changePasswordMethod(data);
    response.fold(
      (failure) => emit(ChangePasswordFailure(message: failure.message)),
      (data) => emit(
        ChangePasswordSuccess(data: data),
      ),
    );
  }
}
