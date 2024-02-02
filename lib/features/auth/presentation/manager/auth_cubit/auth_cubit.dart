import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashionstown/features/auth/data/model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(InitialAppState());
  // create user
  void registerWithEmail({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user?.uid != null) {
        await sendUserDataToFirebase(
          userId: userCredential.user!.uid,
          name: name,
          email: email,
        );
        emit(UserSignSuccessState());
      }
    } on FirebaseAuthException catch (e) {
      emit(FeiledCreatedUserState(massage: e.message!));
    }
  }

// SignIn 
  
  void signIn({required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
          if (credential.user?.uid != null) {
            emit(UserSignSuccessState());
          }
    } on FirebaseAuthException catch (e) {
      emit(FeiledCreatedUserState(massage: e.message!));
    }
  }

// Sign with Google

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
            await sendUserDataToFirebase(email:googleUser!.email ,name:googleUser.displayName??'unkown' ,userId:googleUser.id,);
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    emit(UserSignSuccessState());
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

// send user data to firebase
  
  Future<void> sendUserDataToFirebase(
      {required String userId,
      required String name,
      required String email}) async {
    try {
      UserModel userModel = UserModel(email: email, name: name, userId: userId);
      await FirebaseFirestore.instance
          .collection('User')
          .doc(userId)
          .set(userModel.toJson());
    } on FirebaseException catch (e) {
      emit(FeiledSendUserDataState(massage: e.message!));
    }
  }
}