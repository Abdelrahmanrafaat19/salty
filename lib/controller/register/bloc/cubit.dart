import 'package:bloc/bloc.dart';
import 'package:responsive/controller/register/bloc/state.dart';

import '../repo/register_repo_implr.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterRepoImple registerRepoImple;
  RegisterCubit(this.registerRepoImple) : super(InitState());
  Future<void> postDataRegiter({required Map<String, dynamic> data}) async {
    emit(LoadinRegisterState());
    var response = await registerRepoImple.postData(data: data);

    response.fold((faliure) => emit(FailureRegisterState(faliure.message)),
        (data) => emit(SucessRegisterState(data)));
  }
}
