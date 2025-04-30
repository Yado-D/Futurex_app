part of 'aipage_bloc.dart';

abstract class AipageEvent extends Equatable {
  const AipageEvent();

  @override
  List<Object> get props => [];
}

class SendMessage extends AipageEvent {
  final String text;
  const SendMessage(this.text);
  @override
  List<Object> get props => [text];
}

// class SendInitialMessage extends AipageEvent {}