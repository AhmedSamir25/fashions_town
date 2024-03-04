import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashionstown/core/shared/set_user_id.dart';
import 'package:fashionstown/features/auth/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  SetUserId? saveUserId;
  
 //Sign up 
  Future<void> registerWithEmail(
      String email, String password, String name) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
        SetUserId().setUserId(userId:userCredential.user!.uid );
    await sendUserDataToFirebase(
      userId: userCredential.user!.uid,
      name: name,
      email: email,
    );
  }

//Sign in
  Future<void> signIn(String email, String password) async {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, password: password);
        await SetUserId().setUserId(userId:userCredential.user!.uid );
  }

//Sign with google
  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await SetUserId().setUserId(userId:googleUser!.id);
    await FirebaseAuth.instance.signInWithCredential(credential);
     await sendUserDataToFirebase(email:googleUser.email ,name:googleUser.displayName??'unkown' ,userId:googleUser.id,);
       UserModel(
    email: googleUser.email,
    name: googleUser.displayName ?? 'unknown',
    userId: googleUser.id,
    adress: '',
    phoneNumber: 1,
  );
  }
  Future<void> signOut() async{
    await FirebaseAuth.instance.signOut();
  }

  Future<void> resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  Future<void> sendUserDataToFirebase(
      {required String userId,
      required String name,
      required String email}) async {
    UserModel userModel = UserModel(email: email, name: name, userId: userId,
    adress: '',
    phoneNumber: 1,
    );
    await FirebaseFirestore.instance
        .collection('User')
        .doc(userId)
        .set(userModel.toJson());
  }
}
