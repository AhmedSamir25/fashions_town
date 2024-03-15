import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:fashionstown/core/shared/set_user_id.dart';
import 'package:fashionstown/features/settings/data/model/order_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  List<OrderModel> orderProducts = [];
   bool isProductInCart =true ;
  final productDB = FirebaseFirestore.instance.collection('Order');

  Future<List<OrderModel>> getOrderData() async {
    try {
      emit(LoadingOrderProductData());
      await productDB.where('userId' , isEqualTo:SetUserId().getId()).get().then((productsSnapshot) {
        orderProducts.clear();
        for (var element in productsSnapshot.docs) {
          orderProducts.insert(0, OrderModel.fromFirestore(element));
        }
        emit(GetOrderProductSuccess(orderList:orderProducts));
      });
    } on FirebaseFirestore catch (e) {
      emit(FieldGetOrderProductData(massage: e.toString()));
    }
    return orderProducts;
  }
  void addOrder({
  required String productId,
  required String userId,
  required String productName,
  required String productImage,
  required String productPrice,
  required String productCategory,
  required int productCount,
  required String adress,
  required String deliveryDuration,
  required var historyOrder,
}) async {
  OrderModel orderModel = OrderModel(
    userId:userId ,
    productId: productId,
    productName: productName,
    productImage: productImage,
    productPrice: productPrice,
    productCategory: productCategory,
    productCount: productCount,
    adress:adress ,
    deliveryDuration:deliveryDuration ,
    historyOrder:historyOrder ,
  );
  
  try {
      await FirebaseFirestore.instance
          .collection('Order')
          .doc()
          .set(orderModel.toJson());
    
  }on FirebaseFirestore catch (e) {
    emit(FieldGetOrderProductData(  massage: e.toString(),));
  }
}
}