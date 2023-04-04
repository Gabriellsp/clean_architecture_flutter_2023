import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData? iconButton;
  final String titleButton;
  final void Function()? onPressed;
  const CustomButton({
    this.iconButton,
    required this.titleButton,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: ElevatedButton(
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                iconButton,
                color: Colors.black,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(titleButton),
            ],
          )),
    );
  }
}
