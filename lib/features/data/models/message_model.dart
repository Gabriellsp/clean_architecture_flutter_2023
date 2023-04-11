import 'package:clean_architecture_flutter_2023/features/domain/entities/message_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel extends MessageEntity {
  const MessageModel({
    String id = "",
    String author = "",
    String recipient = "",
    String message = "",
    String timestamp = "",
  }) : super(
          id: id,
          author: author,
          recipient: recipient,
          message: message,
          timestamp: timestamp,
        );

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      author: json['author'],
      recipient: json['recipient'],
      message: json['message'],
      timestamp: json['timestamp'],
    );
  }

  factory MessageModel.fromSnapshot(DocumentSnapshot snapshot) {
    return MessageModel(
      id: snapshot.get('id'),
      author: snapshot.get('author'),
      recipient: snapshot.get('recipient'),
      message: snapshot.get('message'),
      timestamp: snapshot.get('timestamp'),
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "id": id,
      "author": author,
      "recipient": recipient,
      "message": message,
      "timestamp": timestamp,
    };
  }
}
