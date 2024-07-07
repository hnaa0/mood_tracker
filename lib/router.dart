import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracker/features/authentication/views/sign_in_screen.dart';
import 'package:mood_tracker/features/authentication/views/sign_up_screen.dart';

final routerProvider = Provider(
  (ref) {
    return GoRouter(
      initialLocation: SignInScreen.routeUrl,
      routes: [
        GoRoute(
          path: SignInScreen.routeUrl,
          name: SignInScreen.routeName,
          builder: (context, state) => const SignInScreen(),
        ),
        GoRoute(
          path: SignUpScreen.routeUrl,
          name: SignUpScreen.routeName,
          builder: (context, state) => const SignUpScreen(),
        )
      ],
    );
  },
);
