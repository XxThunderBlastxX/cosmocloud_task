import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env', obfuscate: true)
abstract class Env {
  @EnviedField(varName: 'COSMOCLOUD_PROJECT_ID')
  static String cosmocloudProjectID = _Env.cosmocloudProjectID;

  @EnviedField(varName: 'COSMOCLOUD_ENVIRONMENT_ID')
  static String cosmocloudEnvironmentId = _Env.cosmocloudEnvironmentId;

  @EnviedField(varName: 'COSMOCLOUD_BASE_URL')
  static String cosmocloudBaseUrl = _Env.cosmocloudBaseUrl;
}
