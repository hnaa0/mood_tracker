import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracker/constants/colors.dart';
import 'package:mood_tracker/features/authentication/view_models/sign_up_view_model.dart';
import 'package:mood_tracker/features/authentication/widgets/auth_bottom_app_bar.dart';
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

  String _name = "";
  String _email = "";
  String _password = "";

  final Map<String, String> _formData = {};

  void initController() {
    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });
    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });
    _passwordController.addListener(() {
      _password = _passwordController.text;
    });
  }

  void _onSignUpTap() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }

    ref.read(signUpProvider.notifier).signUpWithEmail(
          form: _formData,
          context: context,
        );
  }

  void _onHaveAccountTap() {
    FocusScope.of(context).unfocus();
    context.pop();
  }

  @override
  void initState() {
    super.initState();
    initController();
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
                              fontSize: 32,
                              color: Colors.white,
                              height: 1.2,
                            ),
                          ),
                          Text(
                            "Tracker",
                            style: TextStyle(
                              fontFamily: "McKloudFilled",
                              fontSize: 32,
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
                            "Sign Up with Google",
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
                            "Or Sign Up with",
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
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 40,
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
                                SignUpTextField(
                                  fieldName: "Name",
                                  fieldValue: _name,
                                  controller: _nameController,
                                  formData: _formData,
                                ),
                                const Gap(40),
                                SignUpTextField(
                                  fieldName: "Email",
                                  fieldValue: _email,
                                  controller: _emailController,
                                  formData: _formData,
                                ),
                                const Gap(40),
                                SignUpTextField(
                                  fieldName: "Password",
                                  fieldValue: _password,
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
                      child: Container(
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
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
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
          sentence: "Already have a account",
          name: "Sign In",
          onTapFunc: _onHaveAccountTap,
        ),
      ),
    );
  }
}
