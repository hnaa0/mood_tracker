import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracker/features/authentication/repos/auth_repository.dart';

class SignInViewMidel extends AsyncNotifier<void> {
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
  }
}

final signInProvider = AsyncNotifierProvider<SignInViewMidel, void>(
  () => SignInViewMidel(),
);
