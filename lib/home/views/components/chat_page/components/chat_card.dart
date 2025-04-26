// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:chat_app/home/data/models/chat_model.dart';

import '../../individual_chat/individual_chat_view.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
    required this.chatModel,
    required this.sourceChat,
  });
  final ChatModel chatModel;
  final ChatModel sourceChat;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => IndividualChatView(
                  chatModel: chatModel,
                  sourceModel: sourceChat,
                ),
          ),
        );
      },
      child: ListTile(
        leading: CircleAvatar(
          child:
              chatModel.isGroup ?? false
                  ? Icon(Icons.groups)
                  : Icon(Icons.person),
        ),
        title: Text(
          chatModel.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        subtitle: Row(
          children: [
            const Icon(Icons.done_all, color: Colors.green, size: 16),
            SizedBox(width: 5.w),
            Text(
              chatModel.message ?? 'No message',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
        trailing: Text(chatModel.time ?? "-"),
      ),
    );
  }
}
