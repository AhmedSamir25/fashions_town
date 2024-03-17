import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:fashionstown/core/shared/set_user_id.dart';
import 'package:fashionstown/features/settings/data/model/favorite_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());
  List<FavoriteModel> favoriteProduct = [];
   bool isProductInCart =true ;
  final productDB = FirebaseFirestore.instance
      .collection("User")
      .doc(SetUserId().getId())
      .collection('Favorite');

  Future<List<FavoriteModel>> getFavoriteData() async {
    try {
      emit(LoadingFavoriteProductData());
      await productDB.orderBy('time',
      descending: false).get().then((productsSnapshot) {
        favoriteProduct.clear();
        for (var element in productsSnapshot.docs) {
          favoriteProduct.insert(0, FavoriteModel.fromFirestore(element));
        }
        emit(GetFavoriteProductSuccess(favoriteList:favoriteProduct));
      });
    } on FirebaseFirestore catch (e) {
      emit(FieldGetFavoriteProductData(massage: e.toString()));
    }
    return favoriteProduct;
  }
  void addFavorite({
  required String productId,
  required String productName,
  required String productImage,
  required String productPrice,
  required String productCategory,
}) async {
  FavoriteModel favoriteModel = FavoriteModel(
    productId: productId,
    productName: productName,
    productImage: productImage,
    productPrice: productPrice,
    productCategory: productCategory,
  );
  bool isProductInFavorite = false;
  try {
    for (var product in favoriteProduct) {
      if (product.productId == favoriteModel.productId) {
        isProductInFavorite = true;
        break;
      }
    }
    if (isProductInFavorite) {
      await FirebaseFirestore.instance
          .collection('User')
          .doc(SetUserId().getId())
          .collection('Favorite')
          .doc(favoriteModel.productId)
          .delete();
    } else {
      await FirebaseFirestore.instance
          .collection('User')
          .doc(SetUserId().getId())
          .collection('Favorite')
          .doc(favoriteModel.productId)
          .set(favoriteModel.toJson());
    }
  }on FirebaseFirestore catch (e) {
    emit(FieldGetFavoriteProductData(  massage: e.toString(),));
  }
}

  bool isProductsInFavorite({ String? productId}) {
    
    bool checkFavoriteProduct = favoriteProduct.any((product) => product.productId == productId);
    return checkFavoriteProduct; 
    }
}
