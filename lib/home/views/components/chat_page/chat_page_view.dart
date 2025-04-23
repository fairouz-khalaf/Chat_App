import 'package:chat_app/home/data/models/chat_model.dart';
import 'package:flutter/material.dart';

import '../select_contact/select_contact_view.dart';
import 'components/chat_card.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
      name: 'John Doe',
      message: 'Hello! How are you?',
      time: '2:30 PM',
      icon:
          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      isGroup: false,
    ),
    ChatModel(
      name: 'Jane Smith',
      message: 'See you tomorrow!',
      time: '1:15 PM',
      icon: Icon(Icons.person),

      isGroup: false,
    ),
    ChatModel(
      name: 'Family Group',
      message: 'New message in group!',
      time: '12:45 PM',
      icon: Icon(Icons.group),
      isGroup: true,
    ),
    ChatModel(
      name: 'Alice Johnson',
      message: 'Can you send me the file?',
      time: '11:30 AM',
      icon:
          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      isGroup: false,
    ),
  ];
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
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return ChatCard(chatModel: chats[index]);
        },
      ),
    );
  }
}
