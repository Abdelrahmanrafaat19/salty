part of 'product_cubit.dart';

sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductIsLoading extends ProductState {}

final class ProductSuccess extends ProductState {
  final ProductModel productModel;

  ProductSuccess(this.productModel);
}

final class ProductFailure extends ProductState {
  final dynamic message;

  ProductFailure(this.message);
}
