import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:fashionstown/features/home/data/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());
  final List<ProductModel> productInfo =[];
final productDB = FirebaseFirestore.instance.collection("products");
    Future<void> getProductData({required String productId})async{
      emit(GetCartProductLoading());
        try {
          await productDB.doc(productId).get().then((productSnapshot){
                productInfo.clear();
         productInfo.insert(0,ProductModel.fromFirestore(productSnapshot));
         print(productInfo);
         emit(GetProductDetailSuccess(productInfo: productInfo));
        });
        }on FirebaseFirestore catch (e) {
          emit(GetCartProductField(massage: e.toString()));
        }

    }
}
