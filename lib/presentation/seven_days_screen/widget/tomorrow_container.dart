import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/utils/text_styles.dart';

class TomorrowInfoContainers extends StatelessWidget {
  final String infoText;
  final Image image;
  const TomorrowInfoContainers(
      {super.key, required this.infoText, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        image,
        SizedBox(height: 5.h),
        Text(infoText, style: MyTextStyle.w600.copyWith(fontSize: 7.sp))
      ],
    );
  }
}
