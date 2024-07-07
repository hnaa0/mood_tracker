import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracker/features/user/models/user_model.dart';

class UserRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createProfile(UserModel profile) async {
    await _db.collection("users").doc(profile.uid).set(profile.toJson());
  }
}

final userRepo = Provider(
  (ref) => UserRepository(),
);
