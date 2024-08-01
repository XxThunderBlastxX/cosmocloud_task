import 'package:cosmocloud_task/src/app/utils/utils.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../app/common/widgets/styled_divider.dart';
import '../../../../../app/theme/theme.dart';
import '../../../model/employee_model.dart';
import '../../bloc/employee_list/employee_list_bloc.dart';
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

  late FocusNode _nameFocusNode;

  late FocusNode _streetFocusNode;

  late FocusNode _cityFocusNode;

  late FocusNode _countryFocusNode;

  late FocusNode _zipCodeFocusNode;

  late FocusNode _contactValueFocusNode;

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
    _nameFocusNode = FocusNode();
    _streetFocusNode = FocusNode();
    _cityFocusNode = FocusNode();
    _countryFocusNode = FocusNode();
    _zipCodeFocusNode = FocusNode();
    _contactValueFocusNode = FocusNode();
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
    _nameFocusNode.dispose();
    _streetFocusNode.dispose();
    _cityFocusNode.dispose();
    _countryFocusNode.dispose();
    _zipCodeFocusNode.dispose();
    _contactValueFocusNode.dispose();
  }

  void onPressSubmit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<EmployeeListBloc>().add(
            CreateEmployeeEvent(
              Employee(
                name: _nameController.text.trim(),
                address: Address(
                    line1: _streetController.text.trim(),
                    city: _cityController.text.trim(),
                    country: _countryController.text.trim(),
                    zipCode: _zipCodeController.text.trim()),
                contactMethods: ContactMethod(
                  contactMethod: _contactMethod,
                  value: _contactValueController.text.trim(),
                ),
              ),
            ),
          );
      context.pop();
    }
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
            focusNode: _nameFocusNode,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter employee name';
              }
              return null;
            },
          ),
          const StyledDivider(),
          Text(
            'Address',
            style: AppTheme.theme.textTheme.labelLarge,
          ),
          const SizedBox(height: 8.0),
          StyledTextFormField(
            fieldName: 'Street',
            hintText: 'Enter your street name',
            controller: _streetController,
            focusNode: _streetFocusNode,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter street name';
              }
              return null;
            },
          ),
          StyledTextFormField(
            fieldName: 'City',
            hintText: 'Enter your city',
            controller: _cityController,
            focusNode: _cityFocusNode,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter city name';
              }
              return null;
            },
          ),
          StyledTextFormField(
            fieldName: 'Country',
            hintText: 'Enter your country',
            controller: _countryController,
            focusNode: _countryFocusNode,
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter country name';
              }
              return null;
            },
          ),
          StyledTextFormField(
            fieldName: 'Zip Code',
            hintText: 'Enter zip code',
            controller: _zipCodeController,
            focusNode: _zipCodeFocusNode,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter zip code';
              } else if (value.length < 6) {
                return 'Zip code must be 6 digits';
              } else if (value.toInt().isNaN) {
                return 'Zip code must be numeric';
              }
              return null;
            },
          ),
          const StyledDivider(),
          Text(
            'Contact',
            style: AppTheme.theme.textTheme.labelLarge,
          ),
          const SizedBox(height: 18.0),
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
                  style: AppTheme.theme.textTheme.labelMedium,
                ),
                dropdownMenuEntries: [
                  DropdownMenuEntry(
                    value: ContactMethodType.email,
                    label: 'Email',
                    labelWidget: Text(
                      'Email',
                      style: AppTheme.theme.textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  DropdownMenuEntry(
                    value: ContactMethodType.phone,
                    label: 'Phone',
                    labelWidget: Text(
                      'Phone',
                      style: AppTheme.theme.textTheme.labelMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: StyledTextFormField(
                    showLabel: false,
                    fieldName: 'Contact',
                    hintText: _contactMethod == ContactMethodType.email
                        ? 'Enter your email'
                        : ' Enter phone number',
                    controller: _contactValueController,
                    focusNode: _contactValueFocusNode,
                    keyboardType: _contactMethod == ContactMethodType.email
                        ? TextInputType.emailAddress
                        : TextInputType.phone,
                    lastField: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter contact value';
                      } else if (_contactMethod == ContactMethodType.email &&
                          !value.isValidEmail) {
                        return 'Please enter valid email';
                      } else if (_contactMethod == ContactMethodType.phone &&
                          !value.isInt &&
                          value.length < 10) {
                        return 'Please enter valid phone number';
                      }
                      return null;
                    }),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 28.0),
              child: ElevatedButton(
                onPressed: () => onPressSubmit(context),
                child: Text(
                  'Submit',
                  style: AppTheme.theme.textTheme.labelLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
