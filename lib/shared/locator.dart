import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive/controller/login/repo/login_repo_impl.dart';
import 'package:responsive/controller/product/product_repo/product_repo_imple.dart';
import 'package:responsive/controller/profile/repo/change_password_repo/change_password_Repo_imple.dart';
import 'package:responsive/controller/profile/repo/profile_repo_imple.dart';
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
  getit.registerSingleton<ProfileRepoImpl>(
      ProfileRepoImpl(getit.get<ApiServer>()));
  getit.registerSingleton<ChangePasswordRepoImple>(
    ChangePasswordRepoImple(
      getit.get<ApiServer>(),
    ),
  );
  getit.registerSingleton<ProductRepoImple>(
    ProductRepoImple(
      getit.get<ApiServer>(),
    ),
  );
}
