import 'package:clean_architecture_flutter_2023/features/domain/entities/engage_user_entity.dart';
import 'package:clean_architecture_flutter_2023/features/presentation/cubit/chat/chat_cubit.dart';
import 'package:clean_architecture_flutter_2023/features/presentation/widgets/custom_textfield_widget.dart';
import 'package:clean_architecture_flutter_2023/features/presentation/widgets/message_widget.dart';
import 'package:clean_architecture_flutter_2023/features/presentation/widgets/progress_indicator_widget.dart';
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
  ScrollController listScrollController = ScrollController();

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
      body: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, chatState) {
          if (chatState is ChatLoading) {
            return const ProgressIndicatorWidget(
              text: 'Carregando mensagem, favor aguardar ...',
            );
          } else if (chatState is ChatLoaded) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: chatState.messages.length,
                      controller: listScrollController,
                      itemBuilder: (context, index) {
                        var messageData = chatState.messages[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: messageData.author ==
                                  widget.engageUser.currentUidUser
                              ? MessageWidget(
                                  isMyMessage: true,
                                  message: messageData.message,
                                  showMessageStatus:
                                      index == chatState.messages.length - 1,
                                )
                              : MessageWidget(
                                  isMyMessage: false,
                                  message: messageData.message,
                                  showMessageStatus:
                                      index == chatState.messages.length - 1,
                                ),
                        );
                      }),
                ),
                CustomTextfieldWidget(
                  engageUser: widget.engageUser,
                  channelId: _chatCubit.channelId!,
                  listScrollController: listScrollController,
                ),
              ],
            );
          }
          return const Center(
              child: Text(
                  'Erro ao buscar as imagens, tente novamente mais tarde ...'));
        },
      ),
    );
  }
}
