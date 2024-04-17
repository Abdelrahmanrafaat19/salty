import 'package:dartz/dartz.dart';
import 'package:responsive/shared/faluiar.dart';

abstract class LoginRepo {
  Future<Either<Failure, Map<String, dynamic>>> postLoginData(
      {required Map<String, dynamic> data});
}
