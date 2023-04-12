import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final bool isMyMessage;
  final String message;
  const MessageWidget(
      {Key? key, required this.isMyMessage, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isMyMessage
          ? const EdgeInsets.only(left: 50, right: 8)
          : const EdgeInsets.only(left: 8, right: 50),
      decoration: BoxDecoration(
          color: isMyMessage ? Colors.green : Colors.grey,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.2),
              offset: const Offset(0.0, 0.50),
              spreadRadius: 1,
              blurRadius: 1,
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          message,
        ),
      ),
    );
  }
}
