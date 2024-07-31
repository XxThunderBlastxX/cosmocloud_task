import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../app/theme/theme.dart';
import '../../../model/employee_model.dart';
import '../../bloc/employee_bloc.dart';
import 'styled_text_form_field.dart';

class AddEmployeeForm extends StatefulWidget {
  const AddEmployeeForm({super.key});

  @override
  State<AddEmployeeForm> createState() => _AddEmployeeFormState();
}

class _AddEmployeeFormState extends State<AddEmployeeForm> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;

  late TextEditingController _streetController;

  late TextEditingController _cityController;

  late TextEditingController _countryController;

  late TextEditingController _zipCodeController;

  late TextEditingController _contactValueController;

  var _contactMethod = ContactMethodType.email;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _streetController = TextEditingController();
    _cityController = TextEditingController();
    _countryController = TextEditingController();
    _zipCodeController = TextEditingController();
    _contactValueController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _streetController.dispose();
    _cityController.dispose();
    _countryController.dispose();
    _zipCodeController.dispose();
    _contactValueController.dispose();
  }

  void onPressSubmit(BuildContext context) {
    context.read<EmployeeBloc>().add(
          CreateEmployeeEvent(
            Employee(
              name: _nameController.text.trim(),
              address: Address(
                  line1: _streetController.text.trim(),
                  city: _cityController.text,
                  country: _countryController.text,
                  zipCode: _zipCodeController.text),
              contactMethods: ContactMethod(
                contactMethod: _contactMethod,
                value: _contactValueController.text,
              ),
            ),
          ),
        );
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          StyledTextFormField(
            fieldName: 'Employee Name',
            hintText: 'Enter employee name',
            controller: _nameController,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(),
          ),
          Text(
            'Address',
            style: AppTheme.theme.textTheme.labelLarge,
          ),
          StyledTextFormField(
            fieldName: 'Street',
            hintText: 'Enter your street name',
            controller: _streetController,
          ),
          StyledTextFormField(
            fieldName: 'City',
            hintText: 'Enter your city',
            controller: _cityController,
          ),
          StyledTextFormField(
            fieldName: 'Country',
            hintText: 'Enter your country',
            controller: _countryController,
          ),
          StyledTextFormField(
            fieldName: 'Zip Code',
            hintText: 'Enter zip code',
            controller: _zipCodeController,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(),
          ),
          Text(
            'Contact',
            style: AppTheme.theme.textTheme.labelLarge,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              DropdownMenu<ContactMethodType>(
                initialSelection: _contactMethod,
                onSelected: (value) {
                  setState(() {
                    _contactMethod = value!;
                  });
                },
                label: Text(
                  'Contact Method',
                  style: AppTheme.theme.textTheme.labelLarge,
                ),
                dropdownMenuEntries: const [
                  DropdownMenuEntry(
                    value: ContactMethodType.email,
                    label: 'Email',
                  ),
                  DropdownMenuEntry(
                    value: ContactMethodType.phone,
                    label: 'Phone',
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: StyledTextFormField(
                  fieldName: 'Contact',
                  hintText: _contactMethod == ContactMethodType.email
                      ? 'Enter your email'
                      : ' Enter phone number',
                  controller: _contactValueController,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () => onPressSubmit(context),
              child: Text(
                'Submit',
                style: AppTheme.theme.textTheme.displayMedium!.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
