import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteModel {
  String? productId;
  String? productName;
  String? productImage;
  String? productPrice;
  String? productCategory;
  FavoriteModel(
      {required this.productId,
      required this.productName,
      required this.productImage,
      required this.productPrice,
      required this.productCategory,
      });
  factory FavoriteModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return FavoriteModel(
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

