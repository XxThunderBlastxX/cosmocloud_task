import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../feature/employee/data/repository/repository.dart';
import '../feature/employee/presentation/bloc/employee_bloc.dart';
import 'routes/routes.dart';
import 'service/service.dart';
import 'theme/theme.dart';
import 'utils/utils.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => EmployeeRepository(
        dio: service.get<Dio>(),
        log: service.get<StyledLog>(),
      ),
      child: BlocProvider(
        create: (context) => EmployeeBloc(
          employeeRepository: context.read<EmployeeRepository>(),
        )..add(const GetAllEmployeeEvent()),
        child: MaterialApp.router(
          title: 'CosmoCloud Task',
          theme: AppTheme.theme,
          routerDelegate: AppRouter.router.routerDelegate,
          routeInformationParser: AppRouter.router.routeInformationParser,
          routeInformationProvider: AppRouter.router.routeInformationProvider,
        ),
      ),
    );
  }
}
