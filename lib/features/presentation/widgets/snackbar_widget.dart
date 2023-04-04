import 'package:flutter/material.dart';

void snackBarNetwork({String? message, required BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 3),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              constraints: const BoxConstraints(maxWidth: 280),
              child: Text("$message")),
          const Icon(
            Icons.warning_amber_outlined,
            color: Colors.white,
          ),
        ],
      ),
    ),
  );
}
