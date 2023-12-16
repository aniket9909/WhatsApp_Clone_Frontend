import 'package:flutter/material.dart';
import 'package:whatsapp_clone/utils/constant_color.dart';
import 'package:whatsapp_clone/views/CameraPage.dart';
import 'package:whatsapp_clone/views/ChatPage.dart';
import 'package:whatsapp_clone/views/StatusPage.dart';

import 'CallsPage.dart';

bool isCameraPage = false;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabController;
  bool isChatPage = false;
  bool isCameraPage = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    managetabs();
  }

  void managetabs() {
    tabController.index = 1;
    tabController.addListener(() {
      if (tabController.index == 0) {
        setState(() {
          isCameraPage = true;
          isChatPage = false;
        });
      } else if (tabController.index == 1) {
        setState(() {
          isCameraPage = false;
          isChatPage = true;
        });
      } else {
        setState(() {
          isCameraPage = false;
          isChatPage = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: isChatPage == true
          ? FloatingActionButton(
              onPressed: () {
                print("add new contact");
                print(tabController.index);
              },
              backgroundColor: primaryColor,
              child: const Icon(
                Icons.message,
              ),
            )
          : null,
      appBar: (isCameraPage == false)
          ? AppBar(
              backgroundColor: primaryColor,
              title: const Text('WhatsApp'),
              elevation: 0,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                ),
              ],
              bottom: TabBar(
                controller: tabController,
                indicatorColor: Colors.white,
                indicatorWeight: 4,
                tabs: const [
                  Tab(
                    child: Icon(Icons.camera_alt),
                  ),
                  Tab(
                    child: Text("Chat"),
                  ),
                  Tab(
                    child: Text("Status"),
                  ),
                  Tab(
                    child: Text("Calls"),
                  ),
                ],
              ),
            )
          : null,
      body: TabBarView(
        controller: tabController,
        children: const [CameraPage(), ChatPage(), StatusPage(), CallsPage()],
      ),
    );
  }
}
