import 'package:clean_architecture_flutter_2023/features/presentation/cubit/chat/chat_cubit.dart';
import 'package:clean_architecture_flutter_2023/features/presentation/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late ChatCubit _chatCubit;
  @override
  void initState() {
    super.initState();
    _chatCubit = BlocProvider.of<ChatCubit>(context);
    _chatCubit.getChatMessages("1");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mensagem'),
      ),
      body: BlocBuilder<ChatCubit, ChatState>(builder: (context, chatState) {
        if (chatState is ChatLoaded) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: chatState.messages.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.blueAccent,
                      child: Text(
                        chatState.messages[index].message,
                      ),
                    ),
                  ),
                ),
              ),
              TextField()
            ],
          );
        }
        return const ProgressIndicatorWidget(
          text: 'Carregando mensagens, aguarde um momento ...',
        );
      }),
    );
  }
}
