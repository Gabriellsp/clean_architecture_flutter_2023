import 'package:clean_architecture_flutter_2023/features/presentation/cubit/message/message_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MessageWidget extends StatelessWidget {
  final bool isMyMessage;
  final String message;
  final bool showMessageStatus;
  const MessageWidget({
    Key? key,
    required this.isMyMessage,
    required this.message,
    required this.showMessageStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessageCubit, MessageState>(
        builder: (context, messageState) {
      return Padding(
        padding: isMyMessage
            ? const EdgeInsets.only(left: 50, right: 8)
            : const EdgeInsets.only(left: 8, right: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
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
            ),
            showMessageStatus
                ? Column(
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      SizedBox(
                          width: 10,
                          height: 10,
                          child: _messageStatus(messageState: messageState)),
                    ],
                  )
                : Container()
          ],
        ),
      );
    });
  }

  Widget _messageStatus({required MessageState messageState}) {
    if (messageState is MessageLoading) {
      return const CircularProgressIndicator(
        strokeWidth: 1,
      );
    } else if (messageState is MessageSuccess) {
      return const Icon(
        FontAwesomeIcons.circleCheck,
        size: 10,
      );
    }
    return const Icon(
      FontAwesomeIcons.circleExclamation,
      size: 10,
    );
  }
}
