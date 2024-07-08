import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracker/constants/colors.dart';
import 'package:mood_tracker/features/authentication/view_models/sign_up_view_model.dart';
import 'package:mood_tracker/features/authentication/widgets/auth_bottom_app_bar.dart';
import 'package:mood_tracker/features/authentication/widgets/auth_button.dart';
import 'package:mood_tracker/features/authentication/widgets/sign_up_text_field.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  static const routeUrl = "/sign-up";
  static const routeName = "sign-up";
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final Map<String, String> _formData = {};

  void _onSignUpTap() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      ref.read(signUpProvider.notifier).signUpWithEmail(
            form: _formData,
            context: context,
          );
    }
  }

  void _onHaveAccountTap() {
    FocusScope.of(context).unfocus();
    context.pop();
  }

  @override
  void dispose() {
    _nameController.dispose();
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
                        vertical: 32,
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
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                              left: 32,
                              right: 32,
                              top: 40,
                              bottom: 60,
                            ),
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.3,
                                        color: Color(
                                          ThemeColors.lavenderPink,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Gap(40),
                                SignUpTextField(
                                  fieldName: "Name",
                                  controller: _nameController,
                                  formData: _formData,
                                ),
                                const Gap(40),
                                SignUpTextField(
                                  fieldName: "Email",
                                  controller: _emailController,
                                  formData: _formData,
                                ),
                                const Gap(40),
                                SignUpTextField(
                                  fieldName: "Password",
                                  controller: _passwordController,
                                  formData: _formData,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(18),
                    GestureDetector(
                      onTap: _onSignUpTap,
                      child: const AuthButton(
                        text: "Sign Up",
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
          sentence: "Already have a account?",
          name: "Sign In",
          onTapFunc: _onHaveAccountTap,
        ),
      ),
    );
  }
}
