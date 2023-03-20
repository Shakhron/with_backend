import 'package:client/app/domain/app_builder.dart';

abstract class AppRunner {
  Future<void> preloadData();

  Future<void> run(AppBuilder appBuilder);
}
