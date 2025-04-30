import 'package:equatable/equatable.dart';


class NotificationsSentObject extends Equatable{

  final String? content;
  bool? isSent;
  final DateTime? date;

  NotificationsSentObject({
    required this.content,
    required this.isSent,
    required this.date,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [content,isSent,date];
}


