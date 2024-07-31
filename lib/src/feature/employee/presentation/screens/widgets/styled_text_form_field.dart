import 'package:cosmocloud_task/src/app/theme/theme.dart';
import 'package:flutter/material.dart';

class StyledTextFormField extends StatelessWidget {
  final String fieldName;
  final String hintText;
  final TextEditingController? controller;

  const StyledTextFormField({
    super.key,
    this.controller,
    required this.fieldName,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          fieldName,
          style: AppTheme.theme.textTheme.labelMedium,
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
          ),
        )
      ],
    );
  }
}
