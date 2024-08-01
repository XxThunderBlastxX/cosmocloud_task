import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../feature/employee/data/repository/repository.dart';
import '../feature/employee/presentation/bloc/employee_details/employee_details_bloc.dart';
import '../feature/employee/presentation/bloc/employee_list/employee_list_bloc.dart';
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
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                EmployeeListBloc(context.read<EmployeeRepository>())
                  ..add(const GetAllEmployeeEvent()),
          ),
          BlocProvider(
            create: (context) =>
                EmployeeDetailsBloc(context.read<EmployeeRepository>()),
          ),
        ],
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
