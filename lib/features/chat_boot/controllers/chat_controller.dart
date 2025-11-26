// controllers/chat_controller.dart
import 'package:bz/features/chat_boot/models/message.dart';
import 'package:bz/features/chat_boot/repositories/chat_repository.dart';
import 'package:flutter/foundation.dart';

class ChatController with ChangeNotifier {
  final ChatRepository _repository = ChatRepository();
  final List<Message> _messages = [];

  List<Message> get messages => _messages;

  void addMessage(String text, {bool isUser = true}) {
    _messages.add(Message(text: text, isUser: isUser));
    notifyListeners();
  }

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    // Add user message
    addMessage(text, isUser: true);

    try {
      // Get bot response
      final botMessage = await _repository.sendMessage(text);
      addMessage(botMessage.text, isUser: false);
    } catch (e) {
      addMessage('Sorry, something went wrong.', isUser: false);
    }
  }
}
