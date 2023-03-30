import 'package:client/app/presantation/components/app_text_button.dart';
import 'package:client/app/presantation/components/app_text_field.dart';
import 'package:client/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final controllerLogin = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPassword2 = TextEditingController();
  final controllerPassword = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Screen"),
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
                  controller: controllerEmail,
                  labelText: "email",
                ),
                const SizedBox(height: 16),
                AppTextField(
                  controller: controllerPassword,
                  labelText: "Пароль",
                  obscureText: true,
                ),
                AppTextField(
                  controller: controllerPassword2,
                  labelText: "Повторите пароль",
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                AppTExtButton(
                  onPressed: () {
                    if (globalKey.currentState?.validate() != true) return;
                    if (controllerPassword.text != controllerPassword2.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Пароли не совпадают")));
                    } else {
                      _onTapToSignUp(context.read<AuthCubit>());
                    }
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

  void _onTapToSignUp(AuthCubit authCubit) => authCubit.signUp(
        username: controllerLogin.text,
        password: controllerPassword.text,
        email: controllerEmail.text,
      );
}
