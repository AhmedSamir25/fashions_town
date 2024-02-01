import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashionstown/features/auth/data/model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(InitialAppState());
  void registerWithEmail(
      {required String email, required String password,required String name,}) async {
        
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user?.uid != null) {
        await sendUserDataToFirebase(userId: userCredential.user!.uid,name: name,email:email ,);
        emit(UserCreatedSuccessState());
      }
    } on FirebaseAuthException catch (e) {
      emit(FeiledCreatedUserState(massage: e.message!));
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken, 
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  Future<void>sendUserDataToFirebase({required String userId,required String name,required String email})async{
    try {
          UserModel userModel = UserModel(email: email, name: name, userId: userId);
    await FirebaseFirestore.instance.collection('User').doc(userId).set(userModel.toJson());
    } on FirebaseException catch(e){
      print('ussssssssssssssssssssser======$userId');
      print(e);
    }
  }
}
