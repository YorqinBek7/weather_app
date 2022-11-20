import 'package:flutter/material.dart';
import 'package:weather_app/presentation/home_screen/widget/alert_dialog.dart';

searchDialog({
  required BuildContext context,
  required TextEditingController searchController,
  required Future<void> init,
  required bool firstTime,
  required Future<void> daily,
  required StateSetter setter,
}) async {
  showDialog(
    context: context,
    builder: (context) => AlertDialogCustom(
      searchController: searchController,
      onPressed: (() async {
        Navigator.pop(context);
        await init;
        firstTime = false;
        await daily;
        setter(() {});
      }),
      textForButton: "Search",
      textForTitle: "Search",
    ),
  );
}
