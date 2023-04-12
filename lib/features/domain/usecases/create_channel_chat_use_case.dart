import 'package:clean_architecture_flutter_2023/features/domain/entities/engage_user_entity.dart';
import 'package:clean_architecture_flutter_2023/features/domain/repositories/i_message_repository.dart';

class CreateChannelChatUseCase {
  final IMessageRepository repository;
  CreateChannelChatUseCase({required this.repository});

  Future<String> call(EngageUserEntity engageUser) async =>
      await repository.createChannelChat(engageUser);
}
