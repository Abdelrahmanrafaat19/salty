import 'package:dartz/dartz.dart';
import 'package:responsive/shared/faluiar.dart';

abstract class ChangePasswordRepo {
  Future<Either<Failure, Map<String, dynamic>>> changePasswordMethod(
      Map<String, dynamic> data);
}
