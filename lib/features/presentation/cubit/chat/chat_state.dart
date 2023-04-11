part of 'chat_cubit.dart';

abstract class ChatState extends Equatable {
  const ChatState();
}

class ChatInitial extends ChatState {
  @override
  List<Object> get props => [];
}

class ChatLoading extends ChatState {
  @override
  List<Object> get props => [];
}

class ChatLoaded extends ChatState {
  final List<MessageEntity> messages;
  const ChatLoaded({required this.messages});
  @override
  List<Object> get props => [messages];
}

class ChatFailure extends ChatState {
  @override
  List<Object> get props => [];
}

class MessageLoading extends ChatState {
  @override
  List<Object> get props => [];
}

class MessageSuccess extends ChatState {
  @override
  List<Object> get props => [];
}

class MessageFailure extends ChatState {
  @override
  List<Object> get props => [];
}
