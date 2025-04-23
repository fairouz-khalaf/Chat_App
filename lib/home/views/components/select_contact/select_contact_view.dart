import 'package:chat_app/home/data/models/chat_model.dart';
import 'package:chat_app/home/views/components/select_contact/components/button_card.dart';
import 'package:chat_app/home/views/components/select_contact/components/contact_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectContactView extends StatefulWidget {
  const SelectContactView({super.key});

  @override
  State<SelectContactView> createState() => _SelectContactViewState();
}

class _SelectContactViewState extends State<SelectContactView> {
  List<ChatModel> chats = [
    ChatModel(
      name: 'John Doe',
      status: 'Im using WhatsApp',
      icon: Icon(Icons.person),
    ),
    ChatModel(name: 'Jane Smith', status: 'Im busy', icon: Icon(Icons.person)),
    ChatModel(
      name: 'Tarek Alaa',
      status: 'Im Flutter developer',
      icon: Icon(Icons.person),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF075E54),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),

          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Select Contact',
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),

              Text(
                '234 contacts',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {
                // Implement search functionality here
              },
            ),
            PopupMenuButton(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              itemBuilder:
                  (context) => [
                    const PopupMenuItem(
                      value: 1,
                      child: Text('Invite a friend'),
                    ),
                    const PopupMenuItem(value: 2, child: Text('Refresh')),
                    const PopupMenuItem(value: 3, child: Text('contact us')),
                    const PopupMenuItem(value: 4, child: Text('Help')),
                  ],
              onSelected: (value) {
                print(value);
              },
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: chats.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return ButtonCard(name: "New Group", icon: Icons.group);
            } else if (index == 1) {
              return ButtonCard(
                name: "New Contact",
                icon: Icons.person_add_alt_1_outlined,
              );
            }
            return ContactCard(chatModel: chats[index - 2]);
          },
        ),
      ),
    );
  }
}
