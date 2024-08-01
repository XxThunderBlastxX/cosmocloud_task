import 'package:flutter/material.dart';

class StyledDivider extends StatelessWidget {
  const StyledDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(6.0),
      child: Divider(),
    );
  }
}
