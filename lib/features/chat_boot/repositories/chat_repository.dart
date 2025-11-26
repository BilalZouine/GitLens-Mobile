// data/repositories/chat_repository.dart
import 'package:bz/features/chat_boot/models/message.dart';

class ChatRepository {
  // Simulate bot responses
  String _getBotResponse(String userMessage) {
    final lower = userMessage.toLowerCase();
    if (lower.contains('hello') || lower.contains('hi')) {
      return 'Hello! How can I help you today?';
    } else if (lower.contains('order')) {
      return 'Sure! Please share your order ID.';
    } else if (lower.contains('thank')) {
      return 'You\'re welcome! 😊';
    } else {
      return 'I\'m a demo bot. Try saying "hello" or "help with my order"!';
    }
  }

  Future<Message> sendMessage(String userText) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 600));

    final botReply = _getBotResponse(userText);
    return Message(text: botReply, isUser: false);
  }
}
