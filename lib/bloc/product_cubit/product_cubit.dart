import 'package:bloc/bloc.dart';
import 'package:codeedex_task/data/api_service/api_service.dart';
import 'package:codeedex_task/model/product_model.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  Future<void> fetchAllProducts() async {
    final data = await ApiService.getProduct();
    if (data != null) {
      emit(ProductLoaded(data));
    } else {
      emit(ProductLoadFailed());
    }
  }
}
