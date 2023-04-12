// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:clean_architecture_flutter_2023/features/domain/entities/message_entity.dart';
import 'package:clean_architecture_flutter_2023/features/domain/usecases/send_message_use_case.dart';
import 'package:equatable/equatable.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  final SendMessageUseCase _sendMessageUseCase;
  late Stream<List<MessageEntity>> streamMessage;

  MessageCubit({
    required SendMessageUseCase sendMessageUseCase,
  })  : _sendMessageUseCase = sendMessageUseCase,
        super(MessageInitial());

  void sendMessage(MessageEntity message, String channelId) async {
    emit(MessageLoading());
    try {
      await _sendMessageUseCase
          .call(message, channelId)
          .timeout(const Duration(seconds: 15));
      emit(MessageSuccess());
    } catch (_) {
      emit(MessageFailure());
    }
  }
}
