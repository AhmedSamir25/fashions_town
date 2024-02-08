part of 'product_cubit.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class GetProductDataSuccess extends ProductState{
  //  final List<ProductModel> products;
  //   const GetProductDataSuccess({required this.products});
}

final class FieldGetProductData extends ProductState{
  final String massage;
 const FieldGetProductData({required this.massage});
}
