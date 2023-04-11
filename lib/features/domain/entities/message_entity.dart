import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  final String id;
  final String author;
  final String recipient;
  final String message;
  final String timestamp;

  const MessageEntity({
    this.id = "",
    this.author = "",
    this.recipient = "",
    this.message = "",
    this.timestamp = "",
  });

  @override
  List<Object> get props => [
        id,
        author,
        recipient,
        message,
        timestamp,
      ];
}
