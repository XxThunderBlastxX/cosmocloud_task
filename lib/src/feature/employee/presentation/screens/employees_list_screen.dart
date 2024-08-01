import 'package:cosmocloud_task/src/app/error/error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/theme.dart';
import '../bloc/employee_details/employee_details_bloc.dart';
import '../bloc/employee_list/employee_list_bloc.dart';

class EmployeesListScreen extends StatelessWidget {
  const EmployeesListScreen({super.key});

  void onTapEmployee(BuildContext context, String id) {
    context.read<EmployeeDetailsBloc>().add(GetEmployeeDetailsEvent(id));
    context.push('/employee/$id');
  }

  void onTapDelete(BuildContext context, String id) {
    context.read<EmployeeListBloc>().add(DeleteEmployeeEvent(id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee List'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton.icon(
              onPressed: () => context.push('/create'),
              label: Text(
                'Add Employee',
                style: AppTheme.theme.textTheme.labelMedium!.copyWith(
                  color: Colors.white,
                ),
              ),
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<EmployeeListBloc>().add(const GetAllEmployeeEvent());
        },
        child: BlocConsumer<EmployeeListBloc, EmployeeState>(
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
                        title: Text(
                          employees[idx].name,
                          style: AppTheme.theme.textTheme.labelMedium,
                        ),
                        subtitle: Text(
                          "ID: ${employees[idx].id}",
                          style: AppTheme.theme.textTheme.labelSmall,
                        ),
                        onTap: () => onTapEmployee(context, employees[idx].id!),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () =>
                              onTapDelete(context, employees[idx].id!),
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
      ),
    );
  }
}
