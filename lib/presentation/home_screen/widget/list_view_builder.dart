import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/utils/constants.dart';
import 'package:weather_app/utils/text_styles.dart';

class ListViewBuilder extends StatelessWidget {
  final Color selectedColor;
  final Color notSelectedColor;
  final int dateFormat;
  final int firstDt;
  final int otherDt;
  final String image;
  final double temp;

  const ListViewBuilder(
      {super.key,
      required this.dateFormat,
      required this.firstDt,
      required this.otherDt,
      required this.image,
      required this.temp,
      required this.selectedColor,
      required this.notSelectedColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: firstDt == otherDt ? selectedColor : notSelectedColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          firstDt == otherDt
              ? Text("Now", style: MyTextStyle.w500.copyWith(fontSize: 7.sp))
              : Text(
                  DateFormat.Hm().format(
                    DateTime.fromMillisecondsSinceEpoch(dateFormat * 1000),
                  ),
                  style: MyTextStyle.w500.copyWith(fontSize: 7.sp),
                ),
          Image.network(
            imagePath(image),
            width: 50,
            height: 50,
          ),
          Text(
            "${"$temp".substring(0, 2)}°",
            style: MyTextStyle.w500.copyWith(fontSize: 7.sp),
          ),
        ],
      ),
    );
  }
}
