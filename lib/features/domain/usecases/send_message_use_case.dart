import 'package:clean_architecture_flutter_2023/features/domain/entities/message_entity.dart';
import 'package:clean_architecture_flutter_2023/features/domain/repositories/i_message_repository.dart';

class SendMessageUseCase {
  final IMessageRepository repository;
  SendMessageUseCase({required this.repository});

  Future<void> call(MessageEntity message, String channelId) async =>
      await repository.sendMessage(message, channelId);
}
