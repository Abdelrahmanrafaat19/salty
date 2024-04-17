import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:responsive/controller/login/repo/login_repo.dart';
import 'package:responsive/shared/api_service.dart';
import 'package:responsive/shared/faluiar.dart';

class LoginRepoImplement implements LoginRepo {
  ApiServer apiServer;
  LoginRepoImplement(this.apiServer);
  @override
  Future<Either<Failure, Map<String, dynamic>>> postLoginData(
      {required Map<String, dynamic> data}) async {
    try {
      var response =
          await apiServer.postProfileData(data: data, endPoint: "login");

      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
