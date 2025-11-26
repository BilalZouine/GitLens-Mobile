// widgets/chat_boot_body.dart
import 'package:bz/features/chat_boot/controllers/chat_controller.dart';
import 'package:bz/features/chat_boot/widgets/body_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatBootBody extends StatelessWidget {
  const ChatBootBody({super.key});

  @override
  Widget build(BuildContext context) {
    final messages = context.watch<ChatController>().messages;

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final msg = messages[index];
        return ChatItem(text: msg.text, isUser: msg.isUser);
      },
    );
  }
}
