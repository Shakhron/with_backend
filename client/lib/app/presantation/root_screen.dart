import 'package:client/app/presantation/app_loader.dart';
import 'package:client/feature/auth/ui/components/auth_builder.dart';
import 'package:client/feature/auth/ui/components/login_screen.dart';
import 'package:client/feature/main/ui/main_screen.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBuilder(
      isNotAuthorized: (context) => LoginScreen(),
      isWaiting: (context) => const AppLoader(),
      isAuthorized: (context, value, child) => MainScreen(userEntity: value),
    );
  }
}
