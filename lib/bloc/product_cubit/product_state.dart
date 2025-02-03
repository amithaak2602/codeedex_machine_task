part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}
class ProductLoaded extends ProductState {
  final List<Product> productList;
  ProductLoaded(this.productList);
  List<Object>? get props => productList;
}

class ProductLoadFailed extends ProductState {
  List<Object>? get props => [];
}