part of 'order_cubit.dart';

sealed class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

final class OrderInitial extends OrderState {}

final class LoadingOrderProductData extends OrderState{}

final class FieldGetOrderProductData extends OrderState{
  final String massage;
  const FieldGetOrderProductData({required this.massage});
}

final class GetOrderProductSuccess extends OrderState{
  final List<OrderModel> orderList;
  const GetOrderProductSuccess({required this.orderList});
}