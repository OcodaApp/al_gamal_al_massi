import 'package:al_gamal_al_massi/core/constants/constants.dart';
import 'package:al_gamal_al_massi/presentation/screens/chat_screens/my_chats_screen.dart';
import 'package:al_gamal_al_massi/register.dart';
import 'package:al_gamal_al_massi/view_model/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/cache_helper/shared_pref_methods.dart';
import 'custom_text_form_feild.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) async {
          if (state is LoginSuccessState) {
            Navigator.pop(context);
             await CacheHelper.saveData(
              key: "userId",
              value: state.userCredential?.user?.uid ?? "",
            );
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MyChatsScreen()),
                    (route) => false,
              );
            showToast(
              isError: false,
              message: "Welcome",
            );
          } else if (state is LoginErrorState) {
            Navigator.pop(context);
            showToast(
              isError: true,
              message: state.error ?? "",
            );
          } else if (state is LoginLoadingState) {
            showProgressIndicator(context);
          }
        },
        builder: (context, state) {
          AuthCubit cubit = AuthCubit.get(context);
          return Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.only(top: 0),
              children: [
                Image.asset(
                  'assets/images/map.png',
                  height: 150,
                  fit: BoxFit.cover,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'اردو',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 2,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const Text(
                      'Español',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 2,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'More...',
                        style: TextStyle(
                          color: Color(0xff2070DB),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: AuthCustomTextFormField(
                    hintText: "Email",
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please enter email";
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return "please enter a valid email \nEX:- email@example.com";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: AuthCustomTextFormField(
                    hintText: "Password",
                    obscureText: true,
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please enter password";
                      } else if (value.length < 7) {
                        return "please enter a valid password \nMore than 7 characters";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        cubit.login(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff2070DB),
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Color(0xff2070DB),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "OR",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        backgroundColor: const Color(0xff35A24E),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4))),
                    child: const Text(
                      "Create new account",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
