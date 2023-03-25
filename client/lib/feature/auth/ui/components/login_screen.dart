import 'package:flutter/material.dart';

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
                TextFormField(
                  validator: emptyValodator,
                  maxLength: 1,
                  controller: controllerLogin,
                  decoration: const InputDecoration(
                    labelText: "Логин",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  validator: emptyValodator,
                  maxLength: 1,
                  controller: controllerPassword,
                  decoration: const InputDecoration(
                    labelText: "Пароль",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (globalKey.currentState?.validate() == true) {}
                  },
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all<Size>(
                          const Size(double.maxFinite, 40))),
                  child: const Text("Войти"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? emptyValodator(String? value) {
    if (value!.isEmpty) {
      return "Обязательное полу";
    }
    return null;
  }
}
