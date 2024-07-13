import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracker/constants/colors.dart';
import 'package:mood_tracker/features/authentication/view_models/auth_view_model.dart';
import 'package:mood_tracker/features/authentication/views/sign_up_screen.dart';
import 'package:mood_tracker/features/authentication/widgets/auth_bottom_app_bar.dart';
import 'package:mood_tracker/features/authentication/widgets/auth_button.dart';
import 'package:mood_tracker/features/authentication/widgets/sign_in_text_field.dart';

class SignInScreen extends ConsumerStatefulWidget {
  static const routeUrl = "/sign-in";
  static const routeName = "sign-in";

  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();

  final Map<String, String> _formData = {};

  bool _emailCheck(String value) {
    var pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    return RegExp(pattern).hasMatch(value);
  }

  void _onSignInTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        if (!_emailCheck(_emailController.text)) return;

        _formKey.currentState!.save();

        ref.read(authProvider.notifier).signIn(
              form: _formData,
              context: context,
            );
      }
    }
  }

  void _onNewAccountTap() {
    FocusScope.of(context).unfocus();
    context.pushNamed(SignUpScreen.routeName);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                      key: _formKey,
                      child: Column(
                        children: [
                          SignInTextField(
                            controller: _emailController,
                            fieldName: "Email",
                            formData: _formData,
                            emailCheck: _emailCheck,
                          ),
                          const Gap(18),
                          SignInTextField(
                            controller: _passwordController,
                            fieldName: "Password",
                            formData: _formData,
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
                    GestureDetector(
                      onTap: _onSignInTap,
                      child: const AuthButton(
                        text: "Sign In",
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
          sentence: "Create a new account?",
          name: "Sign Up",
          onTapFunc: _onNewAccountTap,
        ),
      ),
    );
  }
}
