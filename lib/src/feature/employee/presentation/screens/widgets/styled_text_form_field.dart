import 'package:flutter/material.dart';

import '../../../../../app/theme/theme.dart';

class StyledTextFormField extends StatelessWidget {
  final String fieldName;

  final String hintText;

  final TextEditingController? controller;

  final bool showLabel;

  const StyledTextFormField({
    super.key,
    this.controller,
    this.showLabel = true,
    required this.fieldName,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
          visible: showLabel,
          child: Text(
            fieldName,
            style: AppTheme.theme.textTheme.labelMedium,
          ),
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
