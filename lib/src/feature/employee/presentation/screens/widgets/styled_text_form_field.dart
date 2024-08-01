import 'package:flutter/material.dart';

import '../../../../../app/theme/theme.dart';

class StyledTextFormField extends StatelessWidget {
  final String fieldName;

  final String hintText;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final TextInputType? keyboardType;

  final String? Function(String?)? validator;

  final bool showLabel;

  final bool lastField;

  const StyledTextFormField({
    super.key,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.validator,
    this.showLabel = true,
    this.lastField = false,
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
          focusNode: focusNode,
          keyboardType: keyboardType,
          validator: validator,
          onEditingComplete: () => focusNode?.nextFocus(),
          onFieldSubmitted: (_) => lastField ? focusNode?.unfocus() : null,
          autovalidateMode: AutovalidateMode.onUserInteraction,
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
