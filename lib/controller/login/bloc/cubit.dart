import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive/controller/login/bloc/state.dart';
import 'package:responsive/controller/login/repo/login_repo_impl.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginRepoImplement loginRepoImplement;
  LoginCubit(this.loginRepoImplement) : super(LoginInitState());

  Future<void> postLoginData({required Map<String, dynamic> data}) async {
    emit(LoginLoadingState());
    var response = await loginRepoImplement.postLoginData(data: data);
    response.fold(
      (failure) => emit(LoginFailureState(failure.message)),
      (data) => emit(
        LoginSuccesState(data),
      ),
    );
  }
}
