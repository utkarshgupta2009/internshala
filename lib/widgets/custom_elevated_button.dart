import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final dynamic onPressed;
  final String title;
  final Size minSize;
  const CustomElevatedButton(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.minSize});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: minSize,
        backgroundColor: Colors.lightBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
