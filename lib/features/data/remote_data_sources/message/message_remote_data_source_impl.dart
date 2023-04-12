import 'package:clean_architecture_flutter_2023/features/data/models/message_model.dart';
import 'package:clean_architecture_flutter_2023/features/data/remote_data_sources/message/i_message_remote_data_source.dart';
import 'package:clean_architecture_flutter_2023/features/domain/entities/engage_user_entity.dart';
import 'package:clean_architecture_flutter_2023/features/domain/entities/message_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageRemoteDataSourceImpl implements IMessageRemoteDataSource {
  final FirebaseFirestore fireStore;

  MessageRemoteDataSourceImpl({required this.fireStore});

  @override
  Stream<List<MessageEntity>> getMessages(String channelId) {
    final oneToOneChatChannelRef = fireStore.collection("chatChannel");

    final messagesRef =
        oneToOneChatChannelRef.doc(channelId).collection("messages");

    return messagesRef.orderBy('timestamp').snapshots().map((querySnap) =>
        querySnap.docs
            .map((queryDoc) => MessageModel.fromSnapshot(queryDoc))
            .toList());
  }

  @override
  Future<void> sendMessage(MessageEntity message, String channelId) async {
    final messagesRef = fireStore
        .collection("chatChannel")
        .doc(channelId)
        .collection("messages");
    final messageId = messagesRef.doc().id;
    final newMessage = MessageModel(
      id: messageId,
      author: message.author,
      recipient: message.recipient,
      message: message.message,
      timestamp: message.timestamp,
    ).toDocument();

    await messagesRef.doc(messageId).set(newMessage);
  }

  @override
  Future<String> createChannelChat(EngageUserEntity engageUser) async {
    final userCollectionRef = fireStore.collection('users');

    final chatChannelRef = fireStore.collection('chatChannel');

    var userChatChannel = await userCollectionRef
        .doc(engageUser.currentUidUser)
        .collection("chatChannel")
        .doc(engageUser.otherUidUser)
        .get();
    var existChat = userChatChannel.exists;
    if (existChat) return userChatChannel.get('channelId');

    final chatChannelId = chatChannelRef.doc().id;

    var channel = {'channelId': chatChannelId};

    chatChannelRef.doc(chatChannelId).set(channel);

    userCollectionRef
        .doc(engageUser.currentUidUser)
        .collection('chatChannel')
        .doc(engageUser.otherUidUser)
        .set(channel);

    userCollectionRef
        .doc(engageUser.otherUidUser)
        .collection('chatChannel')
        .doc(engageUser.currentUidUser)
        .set(channel);

    return chatChannelId;
  }
}
