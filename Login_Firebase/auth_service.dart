import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> signUP(String e, String p) async {
    try {
      final UserCredential =
          await auth.createUserWithEmailAndPassword(email: e, password: p);
      return UserCredential.user;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<User?> login(String e, String p) async {
    try {
      final UserCredential =
          await auth.signInWithEmailAndPassword(email: e, password: p);
      return UserCredential.user;
    } catch (e) {
      print(e);
    }
    return null;
  }

  logout() async {
    try {
      return await auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
