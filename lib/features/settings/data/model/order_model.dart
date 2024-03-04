import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  String? productId;
  String? productName;
  String? productImage;
  String? productPrice;
  String? productCategory;
  int? productCount;
  OrderModel(
      {required this.productId,
      required this.productName,
      required this.productImage,
      required this.productPrice,
      required this.productCategory,
      required this.productCount,
      });
  factory OrderModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return OrderModel(
      productId: data['productId'],
      productName: data['productName'] ?? 'uknow',
      productPrice: data['productPrice'],
      productCategory: data['productCategory'],
      productImage: data['productImage'],
      productCount: data['productCount'],
    );
  }
   Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productName': productName,
      'productImage': productImage,
      'productPrice': productPrice,
      'productCategory':productCategory,
      'productCount': productCount,
    };
  }
}

