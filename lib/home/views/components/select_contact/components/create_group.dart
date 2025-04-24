import 'package:chat_app/home/data/models/chat_model.dart';
import 'package:chat_app/home/views/components/select_contact/components/contact_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'selected_contact_card.dart';

class CreateGroupView extends StatefulWidget {
  const CreateGroupView({super.key});

  @override
  State<CreateGroupView> createState() => _CreateGroupViewState();
}

class _CreateGroupViewState extends State<CreateGroupView> {
  List<ChatModel> contacts = [
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
  List<ChatModel> selectedContacts = [];
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
                'New Group',
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),

              Text(
                'Add participants ',
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
          ],
        ),

        body: Stack(
          children: [
            ListView.builder(
              itemCount: contacts.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    height: selectedContacts.isNotEmpty ? 90.h : 10.h,
                  );
                }
                return InkWell(
                  onTap: () {
                    if (contacts[index - 1].isSelected == false) {
                      setState(() {
                        contacts[index - 1].isSelected = true;
                        selectedContacts.add(contacts[index - 1]);
                      });
                    } else {
                      setState(() {
                        contacts[index - 1].isSelected = false;
                        selectedContacts.remove(contacts[index - 1]);
                      });
                    }
                  },
                  child: ContactCard(contact: contacts[index - 1]),
                );
              },
            ),

            selectedContacts.isNotEmpty
                ? Column(
                  children: [
                    Container(
                      height: 75.h,
                      color: Colors.white,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          if (contacts[index].isSelected == true) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  contacts[index].isSelected = false;
                                  selectedContacts.remove(contacts[index]);
                                });
                              },
                              child: SelectedContactCard(
                                contact: contacts[index],
                              ),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },

                        itemCount: contacts.length,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),

                    Divider(
                      height: 1.h,
                      color: const Color.fromARGB(255, 175, 173, 173),
                    ),
                  ],
                )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
