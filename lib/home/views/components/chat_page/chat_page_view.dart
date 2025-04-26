import 'package:chat_app/home/data/models/chat_model.dart';
import 'package:flutter/material.dart';

import '../select_contact/select_contact_view.dart';
import 'components/chat_card.dart';

class ChatPage extends StatefulWidget {
  final List<ChatModel> chats;
  final ChatModel sourceChat;
  const ChatPage({super.key, required this.chats, required this.sourceChat});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SelectContactView()),
          );
        },
        backgroundColor: const Color(0xFF075E54),
        child: const Icon(Icons.chat, color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: widget.chats.length,
        itemBuilder: (context, index) {
          return ChatCard(
            chatModel: widget.chats[index],
            sourceChat: widget.sourceChat,
          );
        },
      ),
    );
  }
}
