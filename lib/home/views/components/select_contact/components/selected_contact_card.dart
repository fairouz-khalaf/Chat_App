import 'package:chat_app/home/data/models/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectedContactCard extends StatelessWidget {
  final ChatModel contact;
  const SelectedContactCard({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 207, 203, 203),
                child: Icon(Icons.person, color: Colors.white),
              ),
              Positioned(
                bottom: -2,
                right: -1,
                child: CircleAvatar(
                  radius: 10.r,
                  backgroundColor: const Color.fromARGB(255, 175, 173, 173),
                  child: Icon(Icons.clear, color: Colors.white, size: 20),
                ),
              ),
            ],
          ),
          Text(
            contact.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
