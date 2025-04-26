import 'package:chat_app/home/data/models/chat_model.dart';
import 'package:chat_app/home/views/components/select_contact/components/button_card.dart';
import 'package:chat_app/home/views/home_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late ChatModel sourceChat;
  List<ChatModel> chats = [
    ChatModel(
      name: 'John Doe',
      message: 'Hello! How are you?',
      time: '2:30 PM',
      icon: Icons.person, // You can replace this with an image URL or asset
      isGroup: false,
      id: 1,
    ),
    ChatModel(
      name: 'Jane Smith',
      message: 'See you tomorrow!',
      time: '1:15 PM',
      icon: Icons.person,

      isGroup: false,
      id: 2,
    ),

    ChatModel(
      name: 'Alice Johnson',
      message: 'Can you send me the file?',
      time: '11:30 AM',
      icon: Icons.person,
      isGroup: false,
      id: 3,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder:
            (context, index) => InkWell(
              onTap: () {
                sourceChat = chats.removeAt(index);

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            HomeView(chats: chats, sourceChat: sourceChat),
                  ),
                );
              },
              child: ButtonCard(
                name: chats[index].name,
                icon: chats[index].icon,
              ),
            ),

        itemCount: chats.length,
      ),
    );
  }
}
