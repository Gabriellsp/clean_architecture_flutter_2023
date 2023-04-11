import 'package:clean_architecture_flutter_2023/features/presentation/cubit/chat/chat_cubit.dart';
import 'package:clean_architecture_flutter_2023/features/presentation/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, chatState) {
        if (chatState is ChatLoaded) {
          return Column(
            children: [
              ListView.builder(
                itemBuilder: (context, index) => Text(
                  chatState.messages[index].message,
                ),
              ),
            ],
          );
        }
        return const ProgressIndicatorWidget(
          text: 'Carregando mensagens, aguarde um momento ...',
        );
      },
    );
  }
}
