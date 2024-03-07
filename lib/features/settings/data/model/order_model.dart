import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  String? productId;
  String? productName;
  String? productImage;
  String? productPrice;
  String? productCategory;
  int? productCount;
  String? deliveryDuration;
  final  historyOrder;
  String? userId;
  String? adress;
  OrderModel(
      {required this.productId,
      required this.productName,
      required this.productImage,
      required this.productPrice,
      required this.productCategory,
      required this.productCount,
      required this.adress,
      required this.deliveryDuration,
      required this.historyOrder,
      required this.userId
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
      historyOrder: data['historyOrder'],
      deliveryDuration: data['deliveryDuration'],
      adress: data['adress'],
      userId: data['userId']
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
      'adress' : adress,
      'deliveryDuration' : deliveryDuration,
      'historyOrder': historyOrder,
      'userId' : userId,
    };
  }
}

