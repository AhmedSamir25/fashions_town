part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class LoadingCartProductData extends CartState{}

final class FieldGetCartProductData extends CartState{
  final String massage;
  const FieldGetCartProductData({required this.massage});
}

final class GetCartProductSuccess extends CartState{
  final List<CartModel> cartProducts;
 const GetCartProductSuccess(this.cartProducts);
}

final class AddCartProductTure extends CartState{}

final class AddCartProductFalse extends CartState{}