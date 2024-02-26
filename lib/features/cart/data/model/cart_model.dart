import 'package:cloud_firestore/cloud_firestore.dart';

class CartModel {
  String? productId;
  String? productName;
  String? productImage;
  String? productPrice;
  String? productCategory;
  CartModel(
      {required this.productId,
      required this.productName,
      required this.productImage,
      required this.productPrice,
      required this.productCategory});
  factory CartModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return CartModel(
      productId: data['productId'],
      productName: data['productName'] ?? 'uknow',
      productPrice: data['productPrice'],
      productCategory: data['productCategory'],
      productImage: data['productImage'],
    );
  }
   Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productName': productName,
      'productImage': productImage,
      'productPrice': productPrice,
      'productCategory':productCategory,
    };
  }
}
