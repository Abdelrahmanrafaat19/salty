import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:responsive/controller/register/repo/register_repo.dart';
import 'package:responsive/shared/api_service.dart';
import 'package:responsive/shared/faluiar.dart';

class RegisterRepoImple implements RegisterRepo {
  ApiServer apiServer;
  RegisterRepoImple(this.apiServer);

  @override
  Future<Either<Failure, Map<String, dynamic>>> postData(
      {required Map<String, dynamic> data}) async {
    try {
      var response =
          await apiServer.postProfileData(data: data, endPoint: "register");
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
