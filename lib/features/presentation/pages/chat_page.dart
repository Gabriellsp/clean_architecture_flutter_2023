import 'package:clean_architecture_flutter_2023/features/domain/entities/engage_user_entity.dart';
import 'package:clean_architecture_flutter_2023/features/presentation/cubit/chat/chat_cubit.dart';
import 'package:clean_architecture_flutter_2023/features/presentation/widgets/custom_textfield_widget.dart';
import 'package:clean_architecture_flutter_2023/features/presentation/widgets/message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatefulWidget {
  final EngageUserEntity engageUser;
  const ChatPage({Key? key, required this.engageUser}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late ChatCubit _chatCubit;
  @override
  void initState() {
    super.initState();
    _chatCubit = BlocProvider.of<ChatCubit>(context);
    _chatCubit.getChatMessages(widget.engageUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mensagem'),
      ),
      body: StreamBuilder(
        stream: _chatCubit.streamMessage,
        builder: (context, stream) {
          return Column(
            children: [
              stream.data != null
                  ? Expanded(
                      child: ListView.builder(
                          itemCount: stream.data!.length,
                          itemBuilder: (context, index) {
                            var messageData = stream.data![index];
                            return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: messageData.author ==
                                        widget.engageUser.currentUidUser
                                    ? MessageWidget(
                                        isMyMessage: true,
                                        message: messageData.message,
                                      )
                                    : MessageWidget(
                                        isMyMessage: false,
                                        message: messageData.message,
                                      ));
                          }),
                    )
                  : const Expanded(
                      child: Center(
                        child: Text('Nenhuma mensagem encontrada!'),
                      ),
                    ),
              CustomTextfieldWidget(
                engageUser: widget.engageUser,
                channelId: _chatCubit.channelId!,
              ),
            ],
          );
        },
      ),
    );
  }
}
