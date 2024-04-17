import 'package:dartz/dartz.dart';
import 'package:responsive/shared/faluiar.dart';

abstract class RegisterRepo {
  Future<Either<Failure, Map<String, dynamic>>> postData(
      {required Map<String, dynamic> data});
}
