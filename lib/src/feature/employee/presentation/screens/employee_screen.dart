import 'package:cosmocloud_task/src/app/error/error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/theme.dart';
import '../bloc/employee_details/employee_details_bloc.dart';
import '../bloc/employee_list/employee_list_bloc.dart';

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
      body: BlocConsumer<EmployeeListBloc, EmployeeState>(
        listener: (context, state) {
          switch (state) {
            case EmployeeListErrorState(failure: final failure):
              context.errorBanner(
                failure.message,
                statusCode: failure.code,
              );
              break;
            default:
          }
        },
        builder: (context, state) {
          switch (state) {
            case EmployeeListLoadingState():
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
                      onTap: () {
                        context
                            .read<EmployeeDetailsBloc>()
                            .add(GetEmployeeDetailsEvent(employees[idx].id!));
                        context.push('/employee/${employees[idx].id}');
                      },
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => context
                            .read<EmployeeListBloc>()
                            .add(DeleteEmployeeEvent(employees[idx].id!)),
                      ),
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
