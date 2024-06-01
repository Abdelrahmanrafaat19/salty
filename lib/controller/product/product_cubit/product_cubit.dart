import 'package:bloc/bloc.dart';

import 'package:responsive/controller/product/product_repo/product_repo_imple.dart';
import 'package:responsive/model/product_model/product_model/product_model.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepoImple _productRepoImple;
  ProductCubit(this._productRepoImple) : super(ProductInitial());
  Future<void> getProductMethod() async {
    emit(ProductIsLoading());
    var response = await _productRepoImple.getProductMethod();
    response.fold(
      (failure) => emit(ProductFailure(failure.message)),
      (productModel) => emit(
        ProductSuccess(productModel),
      ),
    );
  }
}
