import 'package:flutter/material.dart';

import '../../../../data/models/chat_model.dart';

class ContactCard extends StatelessWidget {
  final ChatModel chatModel;
  const ContactCard({super.key, required this.chatModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => IndividualChatView(chatModel: chatModel),
        //   ),
        // );
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 175, 173, 173),
          child:
              chatModel.isGroup ?? false
                  ? Icon(Icons.groups, color: Colors.white)
                  : Icon(Icons.person, color: Colors.white),
        ),
        title: Text(
          chatModel.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          chatModel.status ?? 'No message',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ),
    );
  }
}
