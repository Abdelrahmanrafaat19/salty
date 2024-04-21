import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:responsive/controller/profile/repo/profile_repo.dart';
import 'package:responsive/shared/api_service.dart';
import 'package:responsive/shared/faluiar.dart';

class ProfileRepoImpl implements ProfileRepo {
  ApiServer apiServer;

  ProfileRepoImpl(this.apiServer);

  @override
  Future<Either<Failure, Map<String, dynamic>>> getProfileDate() async {
    try {
      var response = await apiServer.getProfilData(
          endPoint: "profile",
          token: Hive.box<String>("my_token").get("token"));

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
