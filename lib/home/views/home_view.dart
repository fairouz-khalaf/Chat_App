import 'package:chat_app/home/data/models/chat_model.dart';
import 'package:flutter/material.dart';

import 'components/camer_page/camera_page_view.dart';
import 'components/chat_page/chat_page_view.dart';

class HomeView extends StatefulWidget {
  final List<ChatModel> chats;
  final ChatModel sourceChat;
  const HomeView({super.key, required this.sourceChat, required this.chats});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  TabController? _tabController;
  final List<Widget> tabs = [
    Tab(child: Icon(Icons.camera_alt)),
    const Tab(text: 'Chats'),
    const Tab(text: 'Status'),
    const Tab(text: 'Calls'),
  ];
  @override
  void initState() {
    _tabController = TabController(
      length: tabs.length,
      vsync: this,
      initialIndex: 1,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF075E54),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Add your search action here
            },
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                const PopupMenuItem(value: 1, child: Text('New Group')),
                const PopupMenuItem(value: 2, child: Text('New Broadcast')),
                const PopupMenuItem(value: 3, child: Text('Linked Devices')),
                const PopupMenuItem(value: 4, child: Text('Starred Messages')),
                const PopupMenuItem(value: 5, child: Text('Settings')),
              ];
            },
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onSelected: (value) {
              print(value);
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          unselectedLabelColor: Colors.white54,
          labelColor: Colors.white,

          tabs: tabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          CameraPageView(),
          ChatPage(chats: widget.chats, sourceChat: widget.sourceChat),
          const Center(child: Text('Status')),
          const Center(child: Text('Calls')),
        ],
      ),
    );
  }
}
