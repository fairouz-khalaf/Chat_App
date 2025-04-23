import 'package:chat_app/home/data/models/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marquee/marquee.dart';

class IndividualChatView extends StatefulWidget {
  const IndividualChatView({super.key, required this.chatModel});
  final ChatModel chatModel;

  @override
  State<IndividualChatView> createState() => _IndividualChatViewState();
}

class _IndividualChatViewState extends State<IndividualChatView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 90.w,
          titleSpacing: 0,
          backgroundColor: Color(0xFF075E54),
          leading: InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                CircleAvatar(
                  child:
                      widget.chatModel.isGroup
                          ? Icon(Icons.groups)
                          : Icon(Icons.person),
                ),
              ],
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.chatModel.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20, // تأكد إنه كافي لعرض النص
                    width: 200, // اضبط العرض حسب المساحة المتاحة
                    child: Marquee(
                      text: 'Last seen today at 2:30 PM',
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                      scrollAxis: Axis.horizontal,
                      blankSpace: 20.0,
                      velocity: 30.0,
                      pauseAfterRound: Duration(seconds: 1),
                      startPadding: 10.0,
                      accelerationDuration: Duration(seconds: 1),
                      accelerationCurve: Curves.linear,
                      decelerationDuration: Duration(milliseconds: 500),
                      decelerationCurve: Curves.easeOut,
                    ),
                  ),
                ],
              ),
            ),
          ),

          actions: [
            IconButton(
              icon: const Icon(Icons.videocam, color: Colors.white),
              onPressed: () {
                // Add your action here
              },
            ),
            IconButton(
              icon: const Icon(Icons.call, color: Colors.white),
              onPressed: () {
                // Add your action here
              },
            ),
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(value: 1, child: Text('View Contact')),
                  const PopupMenuItem(
                    value: 2,
                    child: Text('Media, Links, and Docs'),
                  ),
                  const PopupMenuItem(value: 3, child: Text('Search')),
                  const PopupMenuItem(
                    value: 4,
                    child: Text('Mute Notifications'),
                  ),
                  const PopupMenuItem(value: 5, child: Text('Wallpaper')),
                ];
              },
              icon: const Icon(Icons.more_vert, color: Colors.white),
              onSelected: (value) {
                print(value);
              },
            ),
          ],
        ),
        body: Center(child: Text('Chat with ${widget.chatModel.name}')),
      ),
    );
  }
}
