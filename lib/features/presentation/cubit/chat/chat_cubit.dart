// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:clean_architecture_flutter_2023/features/domain/entities/engage_user_entity.dart';
import 'package:clean_architecture_flutter_2023/features/domain/entities/message_entity.dart';
import 'package:clean_architecture_flutter_2023/features/domain/usecases/create_channel_chat_use_case.dart';
import 'package:clean_architecture_flutter_2023/features/domain/usecases/get_chat_messages_use_case.dart';
import 'package:equatable/equatable.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final GetChatMessagesUseCase _getChatMessagesUseCase;
  final CreateChannelChatUseCase _createChannelChatUseCase;
  Stream<List<MessageEntity>>? streamMessage;
  String? channelId;

  ChatCubit({
    required GetChatMessagesUseCase getChatMessagesUseCase,
    required CreateChannelChatUseCase createChannelChatUseCase,
  })  : _getChatMessagesUseCase = getChatMessagesUseCase,
        _createChannelChatUseCase = createChannelChatUseCase,
        super(ChatInitial());

  void getChatMessages(EngageUserEntity engageUser) async {
    emit(ChatLoading());
    try {
      channelId = await _createChannelChatUseCase.call(engageUser);
      streamMessage = _getChatMessagesUseCase.call(channelId!);
      emit(ChatLoaded(messages: await streamMessage!.first));
    } catch (_) {
      emit(ChatFailure());
    }
  }
}
