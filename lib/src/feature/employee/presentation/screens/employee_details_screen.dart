import 'package:cosmocloud_task/src/app/common/widgets/styled_divider.dart';
import 'package:cosmocloud_task/src/app/error/error.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/theme/theme.dart';
import '../bloc/employee_details/employee_details_bloc.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  final String id;

  const EmployeeDetailsScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Details'),
      ),
      body: BlocConsumer<EmployeeDetailsBloc, EmployeeDetailsState>(
          listener: (context, state) {
        switch (state) {
          case EmployeeDetailsErrorState(failure: final failure):
            context.errorBanner(
              failure.message,
              statusCode: failure.code,
            );
            break;
          default:
        }
      }, builder: (context, state) {
        switch (state) {
          case EmployeeDetailsLoadingState():
            return const Center(
              child: CircularProgressIndicator(),
            );
          case EmployeeDetails(employee: final employee):
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: ${employee.name}',
                    style: AppTheme.theme.textTheme.labelLarge,
                  ),
                  const StyledDivider(),
                  Text(
                    'Address',
                    style: AppTheme.theme.textTheme.labelLarge,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Street: ${employee.address.line1}',
                    style: AppTheme.theme.textTheme.labelMedium,
                  ),
                  Text(
                    'City: ${employee.address.city}',
                    style: AppTheme.theme.textTheme.labelMedium,
                  ),
                  Text(
                    'Country: ${employee.address.country}',
                    style: AppTheme.theme.textTheme.labelMedium,
                  ),
                  Text(
                    'Zip Code: ${employee.address.zipCode}',
                    style: AppTheme.theme.textTheme.labelMedium,
                  ),
                  const StyledDivider(),
                  Text(
                    'Contact Details',
                    style: AppTheme.theme.textTheme.labelLarge,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Contact Method: ${employee.contactMethods.contactMethod.name.capitalize()}',
                    style: AppTheme.theme.textTheme.labelMedium,
                  ),
                  Text(
                    'Contact : ${employee.contactMethods.value}',
                    style: AppTheme.theme.textTheme.labelMedium,
                  ),
                ],
              ),
            );
          default:
            return const Center(
              child: Text('Opps! Something went wrong'),
            );
        }
      }),
    );
  }
}
