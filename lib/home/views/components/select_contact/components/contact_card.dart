import 'package:flutter/material.dart';

import '../../../../data/models/chat_model.dart';

class ContactCard extends StatelessWidget {
  final ChatModel contact;
  const ContactCard({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 175, 173, 173),
            child:
                contact.isGroup ?? false
                    ? Icon(Icons.groups, color: Colors.white)
                    : Icon(Icons.person, color: Colors.white),
          ),
          contact.isSelected ?? false
              ? Positioned(
                bottom: -2,
                right: -1,
                child: Icon(
                  Icons.check_circle,
                  color: const Color.fromARGB(255, 11, 136, 15),
                  size: 20,
                ),
              )
              : const SizedBox.shrink(),
        ],
      ),
      title: Text(
        contact.name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        contact.status ?? 'No message',
        style: TextStyle(fontSize: 14, color: Colors.grey),
      ),
    );
  }
}
