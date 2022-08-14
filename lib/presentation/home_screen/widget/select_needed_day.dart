import 'package:flutter/material.dart';

class SelectNeededDay extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  bool isNeededDay;
  SelectNeededDay(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.isNeededDay});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            color: isNeededDay ? Colors.black : Colors.grey,
            fontSize: 17,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
