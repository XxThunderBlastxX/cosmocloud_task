import 'package:flutter/material.dart';

import 'widgets/add_employee_form.dart';

class NewEmployeeScreen extends StatelessWidget {
  const NewEmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Employee'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.9,
              child: const AddEmployeeForm(),
            ),
          ],
        ),
      ),
    );
  }
}
