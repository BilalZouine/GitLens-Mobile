// models/message.dart
class Message {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  Message({required this.text, required this.isUser, DateTime? timestamp})
    : timestamp = timestamp ?? DateTime.now();

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      text: json['text'],
      isUser: json['isUser'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() => {
    'text': text,
    'isUser': isUser,
    'timestamp': timestamp.toIso8601String(),
  };
}
