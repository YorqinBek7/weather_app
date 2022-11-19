import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/utils/text_styles.dart';

class InformationContainers extends StatelessWidget {
  String text = "";
  String text2 = "";
  String title = "";
  bool firstTime;
  Image image;
  InformationContainers({
    super.key,
    required this.text,
    required this.firstTime,
    required this.text2,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.5.h),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 11),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        children: [
          image,
          SizedBox(width: 8.w),
          Text(
            title,
            style: MyTextStyle.w400.copyWith(fontSize: 7.sp),
          ),
          const Expanded(child: SizedBox()),
          firstTime
              ? Text(text, style: MyTextStyle.w400.copyWith(fontSize: 7.sp))
              : Text(
                  text2,
                  style: MyTextStyle.w400.copyWith(fontSize: 7.sp),
                ),
        ],
      ),
    );
  }
}
