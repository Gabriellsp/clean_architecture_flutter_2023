// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:clean_architecture_flutter_2023/features/domain/entities/message_entity.dart';
import 'package:clean_architecture_flutter_2023/features/domain/usecases/get_chat_messages_use_case.dart';
import 'package:equatable/equatable.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final GetChatMessagesUseCase _getChatMessagesUseCase;
  late Stream<List<MessageEntity>> streamMessage;

  ChatCubit({
    required GetChatMessagesUseCase getChatMessagesUseCase,
  })  : _getChatMessagesUseCase = getChatMessagesUseCase,
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
}
