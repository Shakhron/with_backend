import 'package:client/app/presantation/main_app_builder.dart';
import 'package:client/app/presantation/main_app_runner.dart';

void main() {
  const env = String.fromEnvironment("env", defaultValue: "dev");
  const runner = MainAppRunner(env);
  final builder = MainAppBuilder();
  runner.run(builder);
}
