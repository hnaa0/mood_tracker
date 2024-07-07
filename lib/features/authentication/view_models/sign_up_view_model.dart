import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracker/features/authentication/repos/auth_repository.dart';
import 'package:mood_tracker/features/user/view_models/user_view_model.dart';

class SignUpViewModel extends AsyncNotifier<void> {
  late final AuthRepository _authRepository;

  @override
  FutureOr<void> build() {
    _authRepository = ref.read(authRepo);
  }

  Future<void> signUpWithEmail(
      {required Map<String, String> form,
      required BuildContext context}) async {
    state = const AsyncValue.loading();

    final user = ref.read(userProvider.notifier);

    state = await AsyncValue.guard(() async {
      final userCredential = await _authRepository.signUp(
        email: form["email"]!,
        password: form["password"]!,
      );

      await user.createProfile(userCredential: userCredential, form: form);
    });
  }
}

final signUpProvider = AsyncNotifierProvider<SignUpViewModel, void>(
  () => SignUpViewModel(),
);
