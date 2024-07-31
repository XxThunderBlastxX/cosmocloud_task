import 'package:flutter/material.dart';

import '../../../../app/theme/theme.dart';

class EmployeeScreen extends StatelessWidget {
  const EmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.95,
          child: ListView.separated(
            itemCount: 2,
            separatorBuilder: (context, _) => const Divider(),
            itemBuilder: (context, _) => const ListTile(
              title: Text('Employee Name'),
              subtitle: Text('Employee Id'),
            ),
          ),
        ),
      ),
    );
  }
}
