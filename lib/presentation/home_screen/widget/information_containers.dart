import 'package:flutter/material.dart';
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
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.005),
      padding: EdgeInsets.all(MediaQuery.of(context).size.aspectRatio * 45),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(
              MediaQuery.of(context).size.aspectRatio * 30)),
      child: Row(
        children: [
          image,
          SizedBox(width: MediaQuery.of(context).size.height * 0.005),
          Text(
            title,
            style: MyTextStyle.w500,
          ),
          const Expanded(child: SizedBox()),
          firstTime
              ? Text(text, style: MyTextStyle.w500)
              : Text(
                  text2,
                  style: MyTextStyle.w500,
                ),
        ],
      ),
    );
  }
}
