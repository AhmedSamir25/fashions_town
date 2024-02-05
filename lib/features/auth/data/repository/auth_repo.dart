import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashionstown/features/auth/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  Future<void> registerWithEmail(
      String email, String password, String name) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    await sendUserDataToFirebase(
      userId: userCredential.user!.uid,
      name: name,
      email: email,
    );
  }

  Future<void> signIn(String email, String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  Future<void> sendUserDataToFirebase(
      {required String userId,
      required String name,
      required String email}) async {
    UserModel userModel = UserModel(email: email, name: name, userId: userId);
    await FirebaseFirestore.instance
        .collection('User')
        .doc(userId)
        .set(userModel.toJson());
  }
}
