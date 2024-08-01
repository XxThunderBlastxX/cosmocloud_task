import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../env/env.dart';
import '../utils/utils.dart';

/// [service] is an instance of [GetIt] to get singletons of services.
final service = GetIt.instance;

void serviceLocator() {
  // Registering Dio as a singleton
  service.registerSingleton(Dio(BaseOptions(
    baseUrl: Env.cosmocloudBaseUrl,
    contentType: 'application/json',
    receiveTimeout: const Duration(seconds: 10),
    connectTimeout: const Duration(seconds: 5),
    headers: {
      'projectId': Env.cosmocloudProjectID,
      'environmentId': Env.cosmocloudEnvironmentId,
    },
  )));

  // Registering StyledLog as a singleton
  service.registerSingleton<StyledLog>(
    StyledLog(
      logger: Logger(
        printer: PrettyPrinter(
          colors: true,
          dateTimeFormat: DateTimeFormat.dateAndTime,
          printEmojis: true,
        ),
      ),
    ),
  );
}
