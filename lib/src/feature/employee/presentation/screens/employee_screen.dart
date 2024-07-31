import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/service/service.dart';
import '../../../../app/theme/theme.dart';
import '../../../../app/utils/utils.dart';
import '../../data/repository/repository.dart';
import '../bloc/employee_bloc.dart';

class EmployeeScreen extends StatelessWidget {
  const EmployeeScreen({super.key});

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
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Employee List'),
            actions: [
              ElevatedButton.icon(
                onPressed: () {
                  // TODO: Implement Add Employee
                },
                label: Text(
                  'Add Employee',
                  style: AppTheme.theme.textTheme.displayMedium!.copyWith(
                    color: Colors.white,
                  ),
                ),
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          body: BlocConsumer<EmployeeBloc, EmployeeState>(
            listener: (context, state) {
              switch (state) {
                case ErrorState(failure: final failure):
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(failure.message),
                      backgroundColor: Colors.red,
                    ),
                  );
                  break;
                default:
              }
            },
            builder: (context, state) {
              switch (state) {
                case LoadingState():
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case EmployeeList(employees: final employees):
                  if (employees.isEmpty) {
                    return const Center(
                      child: Text('No Employee Found'),
                    );
                  }
                  return Center(
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.95,
                      child: ListView.separated(
                        itemCount: employees.length,
                        separatorBuilder: (context, _) => const Divider(),
                        itemBuilder: (context, idx) => ListTile(
                          title: Text(employees[idx].name),
                          subtitle: Text("ID: ${employees[idx].id}"),
                          trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                // TODO: Implement Delete Employee
                              }),
                        ),
                      ),
                    ),
                  );
                default:
                  return const Center(
                    child: Text('No Employee Found'),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
