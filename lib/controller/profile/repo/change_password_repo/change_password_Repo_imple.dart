import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:responsive/controller/profile/repo/change_password_repo/change_password_repo.dart';
import 'package:responsive/shared/api_service.dart';
import 'package:responsive/shared/faluiar.dart';

class ChangePasswordRepoImple implements ChangePasswordRepo {
  final ApiServer _apiServer;
  ChangePasswordRepoImple(this._apiServer);
  @override
  Future<Either<Failure, Map<String, dynamic>>> changePasswordMethod(
    Map<String, dynamic> data,
  ) async {
    try {
      var response = await _apiServer.postProfileData(
        data: data,
        endPoint: "change_password",
        token: Hive.box<String>("my_token").get("token"),
      );
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
