import 'package:clean_architecture_flutter_2023/features/data/models/message_model.dart';
import 'package:clean_architecture_flutter_2023/features/data/remote_data_sources/message/i_message_remote_data_source.dart';
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

    return messagesRef.orderBy('time').snapshots().map((querySnap) => querySnap
        .docs
        .map((queryDoc) => MessageModel.fromSnapshot(queryDoc))
        .toList());
  }
}
