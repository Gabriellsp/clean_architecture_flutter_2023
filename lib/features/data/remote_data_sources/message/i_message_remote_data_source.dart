import 'package:clean_architecture_flutter_2023/features/domain/entities/engage_user_entity.dart';
import 'package:clean_architecture_flutter_2023/features/domain/entities/message_entity.dart';

abstract class IMessageRemoteDataSource {
  Stream<List<MessageEntity>> getMessages(String channelId);
  Future<void> sendMessage(MessageEntity message, String channelId);
  Future<String> createChannelChat(EngageUserEntity engageUser);
}
