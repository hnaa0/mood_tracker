import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracker/constants/colors.dart';
import 'package:mood_tracker/features/authentication/views/sign_up_screen.dart';
import 'package:mood_tracker/features/authentication/widgets/auth_bottom_app_bar.dart';

class SignInScreen extends StatefulWidget {
  static const routeUrl = "/sign-in";
  static const routeName = "sign-in";

  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  void _onNewAccountTap() {
    FocusScope.of(context).unfocus();
    context.pushNamed(SignUpScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(
          ThemeColors.uranianBlue,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 36,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 40,
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "MooD",
                            style: TextStyle(
                              fontFamily: "McKloudFilled",
                              fontSize: 40,
                              color: Colors.white,
                              height: 1.2,
                            ),
                          ),
                          Text(
                            "Tracker",
                            style: TextStyle(
                              fontFamily: "McKloudFilled",
                              fontSize: 40,
                              color: Colors.white,
                              height: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 18,
                      ),
                      decoration: const BoxDecoration(
                        color: Color(
                          ThemeColors.babypowder,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(28),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/google.png",
                            width: 22,
                          ),
                          const Gap(8),
                          const Text(
                            "Sign In with Google",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(ThemeColors.outerSpace),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(24),
                    const Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Color(
                              ThemeColors.dimGray,
                            ),
                            thickness: 1,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: Text(
                            "Or Sign In with",
                            style: TextStyle(
                              color: Color(
                                ThemeColors.dimGray,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Color(
                              ThemeColors.dimGray,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(24),
                    Form(
                      child: Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(28),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              autocorrect: false,
                              autofocus: false,
                              decoration: const InputDecoration(
                                labelText: "Email",
                                labelStyle: TextStyle(
                                  color: Color(
                                    ThemeColors.cadetgray,
                                  ),
                                ),
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(28),
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 18,
                                ),
                              ),
                            ),
                          ),
                          const Gap(18),
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(28),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              autocorrect: false,
                              autofocus: false,
                              decoration: const InputDecoration(
                                labelText: "Password",
                                labelStyle: TextStyle(
                                  color: Color(
                                    ThemeColors.cadetgray,
                                  ),
                                ),
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(28),
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(14),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Gap(10),
                        Text(
                          "Forgot a password?",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Color(
                              ThemeColors.outerSpace,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(14),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 18,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(
                          ThemeColors.lavender,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(28),
                        ),
                        border: Border.all(
                          color: const Color(
                            ThemeColors.babypowder,
                          ),
                        ),
                      ),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Gap(20),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: AuthBottomAppBar(
          sentence: "Create a new account",
          name: "Sign Up",
          onTapFunc: _onNewAccountTap,
        ),
      ),
    );
  }
}
