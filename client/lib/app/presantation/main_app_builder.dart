import 'package:client/app/di/init_di.dart';
import 'package:client/app/domain/app_builder.dart';
import 'package:client/app/presantation/root_screen.dart';
import 'package:client/feature/auth/domain/auth_repository.dart';
import 'package:client/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainAppBuilder implements AppBuilder {
  @override
  Widget buildApp() {
    return const _GlobalProviders(
      child: MaterialApp(
        home: Scaffold(
          body: Center(
            child: RootScreen(),
          ),
        ),
      ),
    );
  }
}

class _GlobalProviders extends StatelessWidget {
  const _GlobalProviders({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => locator.get<AuthCubit>())],
      child: child,
    );
  }
}
