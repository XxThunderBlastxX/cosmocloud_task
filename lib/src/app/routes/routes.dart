import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../feature/employee/presentation/screens/employee_details_screen.dart';
import '../../feature/employee/presentation/screens/employee_screen.dart';
import '../../feature/employee/presentation/screens/new_employee_screen.dart';

abstract class AppRouter {
  static GoRouter router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const EmployeeScreen(),
        ),
      ),
      GoRoute(
        path: "/create",
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const NewEmployeeScreen(),
        ),
      ),
      GoRoute(
        path: "/employee/:id",
        pageBuilder: (context, state) {
          final id = state.pathParameters['id']!;
          return MaterialPage(
            key: state.pageKey,
            child: EmployeeDetailsScreen(id: id),
          );
        },
      ),
    ],
  );
}
