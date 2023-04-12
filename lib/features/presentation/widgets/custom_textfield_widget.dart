import 'package:clean_architecture_flutter_2023/features/domain/entities/engage_user_entity.dart';
import 'package:clean_architecture_flutter_2023/features/domain/entities/message_entity.dart';
import 'package:clean_architecture_flutter_2023/features/presentation/cubit/message/message_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextfieldWidget extends StatefulWidget {
  final EngageUserEntity engageUser;
  final ScrollController listScrollController;
  final String channelId;
  const CustomTextfieldWidget({
    Key? key,
    required this.engageUser,
    required this.channelId,
    required this.listScrollController,
  }) : super(key: key);

  @override
  State<CustomTextfieldWidget> createState() => _CustomTextfieldWidgetState();
}

class _CustomTextfieldWidgetState extends State<CustomTextfieldWidget> {
  TextEditingController? _messageController;
  @override
  void initState() {
    _messageController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 16, left: 8, right: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.2),
                        offset: const Offset(0.0, 0.50),
                        spreadRadius: 1,
                        blurRadius: 1,
                      )
                    ]),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 120),
                        child: Scrollbar(
                          child: TextField(
                            style: const TextStyle(fontSize: 14),
                            controller: _messageController,
                            maxLines: null,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Type a message"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            InkWell(
              onTap: () {
                if (_messageController!.text.isNotEmpty) {
                  BlocProvider.of<MessageCubit>(context).sendMessage(
                      MessageEntity(
                        timestamp: Timestamp.now().toString(),
                        message: _messageController!.text,
                        author: widget.engageUser.currentUidUser!,
                        recipient: widget.engageUser.otherUidUser!,
                      ),
                      widget.channelId);
                  _messageController!.clear();
                  final position =
                      widget.listScrollController.position.maxScrollExtent;
                  widget.listScrollController.jumpTo(position + 54);
                }
              },
              child: Container(
                width: 45,
                height: 45,
                decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: const Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ));
  }
}
