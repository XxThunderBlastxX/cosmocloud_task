import 'package:flutter/material.dart';

import '../../../../../app/theme/theme.dart';
import '../../../model/employee_model.dart';
import 'styled_text_form_field.dart';

class AddEmployeeForm extends StatelessWidget {
  const AddEmployeeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          StyledTextFormField(
            fieldName: 'Employee Name',
            hintText: 'Enter employee name',
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
          ),
          StyledTextFormField(
            fieldName: 'City',
            hintText: 'Enter your city',
          ),
          StyledTextFormField(
            fieldName: 'Country',
            hintText: 'Enter your country',
          ),
          StyledTextFormField(
            fieldName: 'Zip Code',
            hintText: 'Enter zip code',
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
                initialSelection: ContactMethodType.phone,
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
                  hintText: 'Enter your email or phone number',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // TODO: Implement submit logic
              },
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
