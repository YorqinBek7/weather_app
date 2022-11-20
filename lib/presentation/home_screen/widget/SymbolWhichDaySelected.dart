import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SymbolOfWhichDaySelected extends StatelessWidget {
  const SymbolOfWhichDaySelected({
    Key? key,
    required this.isNeededDay,
  }) : super(key: key);

  final int isNeededDay;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: double.infinity,
        height: .5.h,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      Positioned(
        left: isNeededDay == 0
            ? 8.w
            : isNeededDay == 1
                ? 58.w
                : null,
        right: isNeededDay > 1 ? 22.w : null,
        child: Container(
          width: 10.w,
          height: 3.h,
          decoration: BoxDecoration(
            color: Theme.of(context).buttonColor,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
    ]);
  }
}
