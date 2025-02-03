import 'package:bloc/bloc.dart';
import 'package:codeedex_task/data/api_service/api_service.dart';
import 'package:codeedex_task/model/product_model.dart';
import 'package:meta/meta.dart';

part 'product_dtl_state.dart';

class ProductDtlCubit extends Cubit<ProductDtlState> {
  ProductDtlCubit() : super(ProductDtlInitial());
  Future<void> fetchProductDetail(int id) async {
    final data = await ApiService.getProductDtl(id);
    if (data != null) {
      emit(ProductDtlLoaded(data));
    } else {
      emit(ProductDtlLoadFailed());
    }
  }
}
