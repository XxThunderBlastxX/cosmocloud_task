import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/theme.dart';
import '../bloc/employee_bloc.dart';

class EmployeeScreen extends StatelessWidget {
  const EmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee List'),
        actions: [
          ElevatedButton.icon(
            onPressed: () => context.push('/create'),
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
    );
  }
}
