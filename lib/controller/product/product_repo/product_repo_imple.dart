import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:responsive/controller/product/product_repo/product_repo.dart';
import 'package:responsive/model/product_model/product_model/product_model.dart';
import 'package:responsive/shared/api_service.dart';
import 'package:responsive/shared/faluiar.dart';

class ProductRepoImple implements ProductRepo {
  // static ProductModel? productModel;
  final ApiServer _apiServer;

  ProductRepoImple(this._apiServer);
  @override
  Future<Either<Failure, ProductModel>> getProductMethod() async {
    try {
      var response = await _apiServer.getProfilData(
          endPoint: "categories/get_with_product_sub/ar/0/0");
      ProductModel productModel = ProductModel.fromJson(response);
      return right(productModel);
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
