import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:fashionstown/core/shared/set_user_id.dart';
import 'package:fashionstown/features/auth/data/model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
   List<UserModel> userInfo =[];
  final productDB = FirebaseFirestore.instance
      .collection("User").doc(SetUserId().getId());
  Future<List<UserModel>> getUserData() async {
    try {
      emit(LodaingGetUserData());
      await productDB.get().then((userSnapshot) {
        userInfo.clear(); 
          userInfo.insert(0,UserModel.fromJson(data: userSnapshot.data() as Map<String, dynamic>));
        emit(SuccessGetUserData(userInfo: userInfo));
      });
    } on FirebaseFirestore catch (e) {
     emit(FieldGetUserData(massage: e.toString()));
    }
    return userInfo;
  }
  
void updateUserAdress({required String adress}) {
  try {
    productDB.update({'adress': adress});
    emit(UpdateUserAdressSuccess());
  }on FirebaseFirestore catch (e) {
    print(e);
  }
    
}
void updateUserPhoneNumber({required int phoneNumber}) {
  try {
        productDB.update({'phoneNumber': phoneNumber});
        emit(UpdateUserPhoneSuccess());
  }on FirebaseFirestore catch (e) {
    print(e);
  }
}
}
