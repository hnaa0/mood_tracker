import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get user => _firebaseAuth.currentUser;
  bool get isLoggedIn => user != null;

  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  Future<UserCredential> signUp(
      {required String email, required String password}) async {
    return _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }
}

final authRepo = Provider(
  (ref) => AuthRepository(),
);
