import 'package:flutter/material.dart';

class AlertDialogCustom extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  final VoidCallback onPressed;
  final String textForButton;
  final String textForTitle;

  AlertDialogCustom(
      {super.key,
      required this.searchController,
      required this.onPressed,
      required this.textForButton,
      required this.textForTitle});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(textForTitle),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.grey.shade200),
              ),
              onPressed: onPressed,
              child: Text(textForButton),
            ),
          ),
        ],
      ),
    );
  }
}
