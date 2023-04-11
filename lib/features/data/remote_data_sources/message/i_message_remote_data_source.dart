import 'package:clean_architecture_flutter_2023/features/domain/entities/message_entity.dart';

abstract class IMessageRemoteDataSource {
  Stream<List<MessageEntity>> getMessages(String channelId);
}
