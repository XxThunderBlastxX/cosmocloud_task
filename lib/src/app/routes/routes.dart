import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../feature/employee/presentation/screens/employee_screen.dart';

class AppRouter {
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
    ],
  );
}
