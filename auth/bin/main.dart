import 'package:auth/auth.dart';
import 'package:auth/utils/app_env.dart';
import 'package:conduit_core/conduit_core.dart';

void main(List<String> arguments) async {
  final port = int.tryParse(AppEnv.port) ?? 0;
  final service = Application<AppService>()..options.port = port;
  await service.start(numberOfInstances: 3, consoleLogging: true);
}
