import 'package:clean_architecture_flutter_2023/features/domain/entities/message_entity.dart';
import 'package:clean_architecture_flutter_2023/features/domain/repositories/i_message_repository.dart';

class GetChatMessagesUseCase {
  final IMessageRepository repository;
  GetChatMessagesUseCase({required this.repository});

  Stream<List<MessageEntity>> call(String channelId) =>
      repository.getChatMessages(channelId);
}
