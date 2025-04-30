// models/message.dart
class Message {
  final String id;
  final String text;
  final DateTime timestamp;
  final bool isUser;

  Message({
    required this.id,
    required this.text,
    required this.timestamp,
    required this.isUser,
  });

  factory Message.user(String text) => Message(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: text,
        timestamp: DateTime.now(),
        isUser: true,
      );

  factory Message.ai(String text) => Message(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: text,
        timestamp: DateTime.now(),
        isUser: false,
      );
}