import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:fashionstown/core/shared/set_user_id.dart';
import 'package:fashionstown/features/settings/data/model/order_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  List<OrderModel> favoriteProduct = [];
   bool isProductInCart =true ;
   final int forListAddOrder = 1;
  final productDB = FirebaseFirestore.instance
      .collection("User")
      .doc(SetUserId().getId())
      .collection('Order');

  Future<List<OrderModel>> getOrderData() async {
    try {
      emit(LoadingOrderProductData());
      await productDB.get().then((productsSnapshot) {
        favoriteProduct.clear();
        for (var element in productsSnapshot.docs) {
          favoriteProduct.insert(0, OrderModel.fromFirestore(element));
        }
        emit(GetOrderProductSuccess(orderList:favoriteProduct));
      });
    } on FirebaseFirestore catch (e) {
      emit(FieldGetOrderProductData(massage: e.toString()));
    }
    return favoriteProduct;
  }
  void addOrder({
  required String productId,
  required String productName,
  required String productImage,
  required String productPrice,
  required String productCategory,
  required int productCount,
}) async {
  OrderModel favoriteModel = OrderModel(
    productId: productId,
    productName: productName,
    productImage: productImage,
    productPrice: productPrice,
    productCategory: productCategory,
    productCount: productCount,
  );
  
  try {
    for (var i = 0; i < forListAddOrder; i++) {
      
    }
      await FirebaseFirestore.instance
          .collection('User')
          .doc(SetUserId().getId())
          .collection('Order')
          .doc()
          .set(favoriteModel.toJson());
    
  }on FirebaseFirestore catch (e) {
    emit(FieldGetOrderProductData(  massage: e.toString(),));
  }
}

//  void controlTheNumberOfItem({required String productId, required int valueButton}) async{
//   await FirebaseFirestore.instance
//           .collection('User')
//           .doc(SetUserId().getId())
//           .collection('Cart')
//           .doc(productId)
//     .update({'productCount': valueButton});
//  }
  
  // bool isProductsInFavorite({ String? productId}) {
  //   bool checkFavoriteProduct = favoriteProduct.any((product) => product.productId == productId);
    
  //     return checkFavoriteProduct;
  //   }
}

