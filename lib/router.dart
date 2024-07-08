import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracker/common/main_nav_screen.dart';
import 'package:mood_tracker/features/authentication/repos/auth_repository.dart';
import 'package:mood_tracker/features/authentication/views/sign_in_screen.dart';
import 'package:mood_tracker/features/authentication/views/sign_up_screen.dart';
import 'package:mood_tracker/features/home/views/home_screen.dart';

final routerProvider = Provider(
  (ref) {
    return GoRouter(
      initialLocation: HomeScreen.routeUrl,
      redirect: (context, state) {
        final isLoggedIn = ref.read(authRepo).isLoggedIn;

        if (isLoggedIn) return null;

        if (!isLoggedIn) {
          if (state.subloc != SignInScreen.routeUrl &&
              state.subloc != SignUpScreen.routeUrl) {
            return SignInScreen.routeUrl;
          }
        }
        return null;
      },
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
        ),
        GoRoute(
          path: "/:tab(home|write|settings)",
          name: MainNavScreen.routeName,
          builder: (context, state) {
            final tab = state.params["tab"]!;

            return MainNavScreen(tab: tab);
          },
        )
      ],
    );
  },
);
