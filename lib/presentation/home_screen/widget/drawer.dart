import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/utils/text_styles.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key, required this.isOn, required this.onTap});
  bool isOn;
  ValueChanged onTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          SizedBox(height: 50.h),
          Text(
            "Menu",
            style: Theme.of(context).textTheme.headline5,
          ),
          ListTile(
            title: Text(
              "Change Theme",
              style: Theme.of(context).textTheme.headline5,
            ),
            trailing: Switch(value: isOn, onChanged: onTap),
          ),
          ListTile(
            title: Text(
              "Settings",
              style: Theme.of(context).textTheme.headline5,
            ),
            trailing:
                Icon(Icons.arrow_right, color: Theme.of(context).buttonColor),
          ),
          ListTile(
            title:
                Text("Settings", style: Theme.of(context).textTheme.headline5),
            trailing:
                Icon(Icons.arrow_right, color: Theme.of(context).buttonColor),
          ),
          ListTile(
            title:
                Text("Settings", style: Theme.of(context).textTheme.headline5),
            trailing:
                Icon(Icons.arrow_right, color: Theme.of(context).buttonColor),
          ),
          const Spacer(),
          Text(
            "By YorqinBek Yuldashev",
            style: MyTextStyle.w500.copyWith(fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
