import 'package:chat_app/home/data/models/chat_model.dart';
import 'package:chat_app/home/views/components/individual_chat/components/bottom_sheet.dart';
import 'package:chat_app/home/views/components/individual_chat/components/replay_message_card.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marquee/marquee.dart';

import 'components/own_message_card.dart';

class IndividualChatView extends StatefulWidget {
  const IndividualChatView({super.key, required this.chatModel});
  final ChatModel chatModel;

  @override
  State<IndividualChatView> createState() => _IndividualChatViewState();
}

class _IndividualChatViewState extends State<IndividualChatView> {
  bool showEmoji = false;
  final TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          showEmoji = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: WillPopScope(
          onWillPop: () {
            if (showEmoji) {
              setState(() {
                showEmoji = false;
              });
              return Future.value(false);
            }
            return Future.value(true);
          },
          child: Scaffold(
            backgroundColor: Colors.blueGrey.withAlpha(230),
            appBar: AppBar(
              leadingWidth: 90.w,
              titleSpacing: 0,
              backgroundColor: const Color(0xFF075E54),
              leading: InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const CircleAvatar(child: Icon(Icons.person)),
                  ],
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.chatModel.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                      width: 200.w,
                      child: Marquee(
                        text: 'Last seen today at 2:30 PM',
                        style: TextStyle(fontSize: 14, color: Colors.white),
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
              actions: [
                IconButton(
                  icon: const Icon(Icons.videocam, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.call, color: Colors.white),
                  onPressed: () {},
                ),
                PopupMenuButton(
                  icon: const Icon(Icons.more_vert, color: Colors.white),
                  itemBuilder:
                      (context) => [
                        const PopupMenuItem(
                          value: 1,
                          child: Text('View Contact'),
                        ),
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
                      ],
                  onSelected: (value) {
                    print(value);
                  },
                ),
              ],
            ),
            body: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height - 140.h,
                  child: ListView(
                    shrinkWrap: true,
                    children: [OwnMessageCard(), const ReplyMessageCard()],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 55.w,
                      child: Card(
                        margin: EdgeInsets.only(
                          left: 5.w,
                          right: 2.w,
                          bottom: 8.h,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: TextFormField(
                            controller: textEditingController,
                            focusNode: focusNode,
                            textAlignVertical: TextAlignVertical.center,
                            maxLines: 6,
                            minLines: 1,
                            keyboardType: TextInputType.multiline,
                            onTap: () {
                              setState(() {
                                showEmoji = false;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'Type a message ...',
                              border: InputBorder.none,
                              prefixIcon: IconButton(
                                icon: const Icon(
                                  Icons.emoji_emotions_outlined,
                                  color: Color(0xFF075E54),
                                ),
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  Future.delayed(
                                    const Duration(milliseconds: 100),
                                    () {
                                      setState(() {
                                        showEmoji = !showEmoji;
                                      });
                                    },
                                  );
                                },
                              ),
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.attach_file,
                                      color: Color(0xFF075E54),
                                    ),
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (build) => BottomSheetWidget(),
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.camera_alt,
                                      color: Color(0xFF075E54),
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 12.h,
                        left: 5.w,
                        right: 5.w,
                      ),
                      child: CircleAvatar(
                        backgroundColor: const Color(0xFF075E54),
                        radius: 22.r,
                        child: IconButton(
                          icon: const Icon(Icons.mic, color: Colors.white),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
                if (showEmoji)
                  SizedBox(
                    height: 250.h,
                    child: EmojiPicker(
                      onEmojiSelected: (category, emoji) {
                        print(emoji);
                        setState(() {
                          textEditingController.text += emoji.emoji;
                        });
                      },
                      textEditingController: textEditingController,
                      config: Config(
                        height: 256,
                        emojiViewConfig: EmojiViewConfig(
                          columns: 7,
                          emojiSizeMax:
                              32 *
                              (Theme.of(context).platform == TargetPlatform.iOS
                                  ? 1.30
                                  : 1.0),
                        ),
                        categoryViewConfig: const CategoryViewConfig(
                          backgroundColor: Colors.white,
                          indicatorColor: Color(0xFF075E54),
                          iconColorSelected: Color(0xFF075E54),
                        ),
                        bottomActionBarConfig: const BottomActionBarConfig(
                          backgroundColor: Colors.white,
                          buttonColor: Color(0xFF075E54),
                        ),
                        searchViewConfig: const SearchViewConfig(
                          backgroundColor: Colors.white,

                          hintText: 'Search Emoji...',
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
