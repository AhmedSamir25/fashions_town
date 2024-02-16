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
      productName: data['name'] ?? 'uknow',
      productPrice: data['price'],
      productCategory: data['productCategory'],
      productImage: data['productImage'],
    );
  }
}
