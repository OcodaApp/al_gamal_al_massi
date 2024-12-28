import 'package:al_gamal_al_massi/core/cache_helper/shared_pref_methods.dart';
import 'package:al_gamal_al_massi/presentation/screens/chat_screens/my_chats_screen.dart';
import 'package:al_gamal_al_massi/view_model/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/constants/constants.dart';
import 'custom_text_form_feild.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state)async {
          if (state is RegisterSuccessState) {
            AuthCubit.get(context).uploadUserIdAndEmailToFireStore(
              credentials: state.userCredential!,
              userName: userNameController.text,
            );
          } else if (state is RegisterErrorState) {
            Navigator.pop(context);
            showToast(
              isError: true,
              message: state.error ?? "",
            );
          } else if (state is RegisterLoadingState) {
            showProgressIndicator(context);
          } else if (state is UploadUserDataSuccess) {
            await CacheHelper.saveData(
              key: "userId",
              value: state.userId,
            );
            Navigator.pop(context);

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const MyChatsScreen()),
                  (route) => false,
            );
            showToast(
              isError: false,
              message: "Welcome ${state.userName ?? ""}",
            );
          } else if (state is UploadUserDataError) {
            Navigator.pop(context);
            showToast(
              isError: true,
              message: state.error ?? "",
            );
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
                    hintText: "User Name",
                    controller: userNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please enter password";
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
                        cubit.register(
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
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
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
