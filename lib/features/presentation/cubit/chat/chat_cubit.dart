// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:clean_architecture_flutter_2023/features/domain/entities/message_entity.dart';
import 'package:clean_architecture_flutter_2023/features/domain/usecases/get_chat_messages_use_case.dart';
import 'package:clean_architecture_flutter_2023/features/domain/usecases/send_message_use_case.dart';
import 'package:equatable/equatable.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final GetChatMessagesUseCase _getChatMessagesUseCase;
  final SendMessageUseCase _sendMessageUseCase;
  late Stream<List<MessageEntity>> streamMessage;

  ChatCubit({
    required GetChatMessagesUseCase getChatMessagesUseCase,
    required SendMessageUseCase sendMessageUseCase,
  })  : _getChatMessagesUseCase = getChatMessagesUseCase,
        _sendMessageUseCase = sendMessageUseCase,
        super(ChatInitial());

  void getChatMessages(String channelId) async {
    emit(ChatLoading());
    try {
      streamMessage = _getChatMessagesUseCase.call(channelId);
      emit(ChatLoaded(messages: await streamMessage.first));
    } catch (_) {
      emit(ChatFailure());
    }
  }

  void sendMessage(MessageEntity message, String channelId) async {
    emit(MessageLoading());
    try {
      _sendMessageUseCase.call(message, channelId);
      emit(MessageSuccess());
    } catch (_) {
      emit(MessageFailure());
    }
  }
}
