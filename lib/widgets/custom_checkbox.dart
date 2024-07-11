import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCheckbox extends StatelessWidget {
  final Widget title;
  final bool value;
  final dynamic onChanged;
  dynamic secondary;

  CustomCheckbox({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.secondary,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          checkColor: Colors.white,
          activeColor: Colors.blue,
        ),
        title,
        if (secondary != null) ...[
          const SizedBox(width: 4), // Adjust this value as needed
          secondary,
        ],
      ],
    );
  }
}
