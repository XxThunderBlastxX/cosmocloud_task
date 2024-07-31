import 'package:cosmocloud_task/src/app/utils/log.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../env/env.dart';

final service = GetIt.instance;

void serviceLocator() {
  // Registering Dio as a singleton
  service.registerSingleton(Dio(BaseOptions(
    baseUrl: Env.cosmocloudBaseUrl,
    contentType: 'application/json',
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
