import 'package:dartz/dartz.dart';
import 'package:responsive/shared/faluiar.dart';

abstract class ProfileRepo {
  Future<Either<Failure, Map<String, dynamic>>> getProfileDate();
}
