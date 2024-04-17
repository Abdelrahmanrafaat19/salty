import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive/controller/login/repo/login_repo_impl.dart';
import 'package:responsive/controller/register/repo/register_repo_implr.dart';
import 'package:responsive/shared/api_service.dart';

var getit = GetIt.instance;

void setUp() {
  getit.registerSingleton<ApiServer>(
    ApiServer(Dio()),
  );
  getit.registerSingleton<RegisterRepoImple>(
      RegisterRepoImple(ApiServer(Dio())));

  getit.registerSingleton<LoginRepoImplement>(
      LoginRepoImplement(getit.get<ApiServer>()));
}
