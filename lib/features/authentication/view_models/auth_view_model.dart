import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracker/features/authentication/repos/auth_repository.dart';
import 'package:mood_tracker/features/home/views/home_screen.dart';
import 'package:mood_tracker/features/user/view_models/user_view_model.dart';

class AuthViewModel extends AsyncNotifier<void> {
  late final AuthRepository _authRepository;

  @override
  FutureOr<void> build() {
    _authRepository = ref.read(authRepo);
  }

  Future<void> signIn(
      {required Map<String, String> form,
      required BuildContext context}) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await _authRepository.signInWithEmail(
        email: form["email"]!,
        password: form["password"]!,
      );
    });

    if (state.hasError) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text((state.error as FirebaseException).message ??
              "something went wrong :("),
        ),
      );
    } else {
      if (!context.mounted) return;
      context.go(HomeScreen.routeUrl);
    }
  }

  Future<void> signUpWithEmail(
      {required Map<String, String> form,
      required BuildContext context}) async {
    state = const AsyncValue.loading();

    final user = ref.read(userProvider.notifier);

    state = await AsyncValue.guard(() async {
      final userCredential = await _authRepository.signUpWithEmail(
        email: form["email"]!,
        password: form["password"]!,
      );

      await user.createProfile(userCredential: userCredential, form: form);
    });
  }

  Future<void> signOut() async {
    state = await AsyncValue.guard(() async {
      await _authRepository.signOut();
    });
  }
}

final authProvider = AsyncNotifierProvider<AuthViewModel, void>(
  () => AuthViewModel(),
);
