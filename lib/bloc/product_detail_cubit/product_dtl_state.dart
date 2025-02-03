part of 'product_dtl_cubit.dart';

@immutable
abstract class ProductDtlState {}

class ProductDtlInitial extends ProductDtlState {}
class ProductDtlLoaded extends ProductDtlState {
  final List<Product> productList;
  ProductDtlLoaded(this.productList);
  List<Object>? get props => productList;
}

class ProductDtlLoadFailed extends ProductDtlState {
  List<Object>? get props => [];
}