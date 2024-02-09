import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:fashionstown/features/home/data/model/product_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  List<ProductModel> searchproducts = [];

  Future<List<ProductModel>> getProductCategory(
      {required String productName}) async {
    try {
      emit(SearchLoading());
      await FirebaseFirestore.instance
          .collection('products')
          .where("name", isEqualTo: productName)
          .get()
          .then((productsSnapshot) {
        searchproducts.clear();
        for (var element in productsSnapshot.docs) {
          searchproducts.insert(0, ProductModel.fromFirestore(element));
        }
      });
      emit(SearchSuccess());
    } on FirebaseException catch (e) {
      emit(FieldSearch(massage: e.message!));
    }
    return searchproducts;
  }
}
