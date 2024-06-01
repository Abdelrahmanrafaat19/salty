import 'package:dartz/dartz.dart';
import 'package:responsive/model/product_model/product_model/product_model.dart';
import 'package:responsive/shared/faluiar.dart';

abstract class ProductRepo {
  Future<Either<Failure, ProductModel>> getProductMethod();
}
