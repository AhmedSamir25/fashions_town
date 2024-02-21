import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:fashionstown/core/shared/set_user_id.dart';
import 'package:fashionstown/features/cart/data/model/cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
   CartCubit() : super(CartInitial());

  List<CartModel> cartProduct = [];
  final productDB = FirebaseFirestore.instance.collection("products");
  void addCart({
    required String productId,
    required String productName,
    required String productImage,
    required String productPrice,
    required String productCategory,
  }) async{
    try {
      CartModel cartModel = CartModel(productId: productId, productName: productName, productImage: productImage, productPrice: productPrice, productCategory: productCategory);
       await FirebaseFirestore.instance
        .collection('User').doc(SetUserId().getId()).collection('Cart').doc(productId)
        .set(cartModel.toJson());
    }on FirebaseFirestore catch (e) {
      emit(FieldGetCartProductData(massage:e.toString()));
    }
  }
}
