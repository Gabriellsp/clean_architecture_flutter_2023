part of 'message_cubit.dart';

abstract class MessageState extends Equatable {
  const MessageState();
}

class MessageInitial extends MessageState {
  @override
  List<Object> get props => [];
}

class MessageLoading extends MessageState {
  @override
  List<Object> get props => [];
}

class MessageSuccess extends MessageState {
  @override
  List<Object> get props => [];
}

class MessageFailure extends MessageState {
  @override
  List<Object> get props => [];
}
