import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:fashionstown/features/home/data/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
   List<ProductModel> searchProducts = [];
 List<ProductModel> streamSearchProducts = [];
 final productDB = FirebaseFirestore.instance.collection("products");
    void getSearchProduct({required String productName}) {
    searchProducts.clear();
        searchProducts = streamSearchProducts.where((element) => element.productName!.toLowerCase().startsWith(productName.toLowerCase())).toList();
      }
  Stream<List<ProductModel>> fetchProductsStream() {
    try {
      return productDB.orderBy('time',
      descending: false).snapshots().map((snapshot) {
         streamSearchProducts.clear();
        for (var element in snapshot.docs) {
          streamSearchProducts.insert(0, ProductModel.fromFirestore(element));
        }
        return streamSearchProducts;
      });
    } catch (e) {
      rethrow;
    }
  }    
}

