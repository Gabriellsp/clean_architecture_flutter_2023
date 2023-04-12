import 'package:clean_architecture_flutter_2023/features/data/remote_data_sources/message/i_message_remote_data_source.dart';
import 'package:clean_architecture_flutter_2023/features/domain/entities/engage_user_entity.dart';
import 'package:clean_architecture_flutter_2023/features/domain/entities/message_entity.dart';
import 'package:clean_architecture_flutter_2023/features/domain/repositories/i_message_repository.dart';

class MessageRepositoryImpl implements IMessageRepository {
  IMessageRemoteDataSource messageRemoteDataSource;
  MessageRepositoryImpl({required this.messageRemoteDataSource});

  @override
  Stream<List<MessageEntity>> getChatMessages(String channelId) =>
      messageRemoteDataSource.getMessages(channelId);

  @override
  Future<void> sendMessage(MessageEntity message, String channelId) async =>
      await messageRemoteDataSource.sendMessage(message, channelId);

  @override
  Future<String> createChannelChat(EngageUserEntity engageUser) async =>
      await messageRemoteDataSource.createChannelChat(engageUser);
}
