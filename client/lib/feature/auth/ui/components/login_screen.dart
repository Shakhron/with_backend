import 'package:client/app/presantation/components/app_text_button.dart';
import 'package:client/app/presantation/components/app_text_field.dart';
import 'package:client/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final controllerLogin = TextEditingController();
  final controllerPassword = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: Form(
        key: globalKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppTextField(
                  controller: controllerLogin,
                  labelText: "Логин",
                ),
                const SizedBox(height: 16),
                AppTextField(
                  controller: controllerPassword,
                  labelText: "Пароль",
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                AppTExtButton(
                  onPressed: () {
                    if (globalKey.currentState?.validate() == true) {
                      _onTapToSignIn(context.read<AuthCubit>());
                    }
                  },
                  text: "Войти",
                ),
                const SizedBox(height: 16),
                AppTExtButton(
                  onPressed: () {
                    if (globalKey.currentState?.validate() == true) {}
                  },
                  backgroundColor: Colors.grey,
                  text: "Регистрация",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapToSignIn(AuthCubit authCubit) => authCubit.signIn(
      username: controllerLogin.text, password: controllerPassword.text);
}
