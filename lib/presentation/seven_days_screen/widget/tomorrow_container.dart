import 'package:flutter/material.dart';
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
        const SizedBox(height: 5),
        Text(infoText,
            style: MyTextStyle.w500.copyWith(
                fontSize: MediaQuery.of(context).size.aspectRatio * 30))
      ],
    );
  }
}
