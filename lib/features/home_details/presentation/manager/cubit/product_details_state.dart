part of 'product_details_cubit.dart';

sealed class ProductDetailsState extends Equatable {
  const ProductDetailsState();

  @override
  List<Object> get props => [];
}

final class ProductDetailsInitial extends ProductDetailsState {}

final class GetProductDetailSuccess extends ProductDetailsState{
  final List<ProductModel> productInfo ;
  const  GetProductDetailSuccess({required this.productInfo});
}

final class GetCartProductField extends ProductDetailsState{
  final String massage;
  const GetCartProductField({required this.massage});
}

final class GetCartProductLoading extends ProductDetailsState{}
