import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserCredential> signIn(String email, String password) {
    return auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> signUp(String email, String password) {
    return auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  void logout() async {
    await auth.signOut().then((value) => print("User Logout"));
  }
}
