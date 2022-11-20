import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        style: Theme.of(context).textTheme.headline6!.copyWith(
              fontSize: 8.sp,
              color: isNeededDay
                  ? Theme.of(context).selectedRowColor
                  : Theme.of(context).disabledColor,
            ),
      ),
    );
  }
}
