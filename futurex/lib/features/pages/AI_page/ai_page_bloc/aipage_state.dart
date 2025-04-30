part of 'aipage_bloc.dart';

class Message {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  Message({
    required this.text,
    required this.isUser,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  factory Message.user(String text) => Message(text: text, isUser: true);
  factory Message.ai(String text) => Message(text: text, isUser: false);
}

abstract class AipageState extends Equatable{
  final List<Message> messages;
  final bool isLoading;

  const AipageState({
    required this.messages,
    this.isLoading = false,
  });

  List<Object> get props => [messages, isLoading];
}

class AipageInitial extends AipageState {
  AipageInitial() : super(messages: []);
}

class AipageLoading extends AipageState {
  const AipageLoading(List<Message> messages)
      : super(messages: messages, isLoading: true);
}

class AipageSuccess extends AipageState {
  const AipageSuccess(List<Message> messages)
      : super(messages: messages, isLoading: false);
}

class AipageError extends AipageState {
  final String error;

  const AipageError(List<Message> messages, this.error)
      : super(messages: messages, isLoading: false);

  @override
  List<Object> get props => [error, ...super.props];
}