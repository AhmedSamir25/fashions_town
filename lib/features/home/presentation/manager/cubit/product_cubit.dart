import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:fashionstown/features/home/data/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';


class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
ProductModel? productModel;
 List<ProductModel> products = [];
 List<QueryDocumentSnapshot> banners = [];
  List<ProductModel> get getProducts {
    return products;
  }
  Future<List<ProductModel>> getProductData() async {
    try {
      emit(LoadingGetProductData());
       await FirebaseFirestore.instance.collection('products').orderBy('time',
      descending: false).get().then((productsSnapshot){
        products.clear();
        for (var element in productsSnapshot.docs) {
          products.insert(0, ProductModel.fromFirestore(element));
        }
      }
      );
      emit(GetProductDataSuccess());
       
    }on FirebaseException catch (e) {
      emit(FieldGetProductData(massage: e.message!));
    }
    return products;
  }
  
  //Get Banners
  Future<void> getBannersData() async {
    try {
      emit(LoadingGetProductData());
       final querySnapshot = await FirebaseFirestore.instance.collection('banner').get();
         banners.clear();
       banners.addAll(querySnapshot.docs);
      emit(GetProductDataSuccess());
    }on FirebaseException catch (e) {
      emit(FieldGetProductData(massage: e.message!));
    }
  }
}




 