import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/controller/User_controller.dart';
import 'package:whatsapp_clone/utils/constant_color.dart';
import 'package:whatsapp_clone/views/ChatView.dart';

import '../widget/CommonWidget.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final User_controller _userController = Get.put(User_controller());
  @override
  void initState() {
    super.initState();
    _userController.getUserChats();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          child: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              print("call");
              Get.to(() => const ChatView(),
                  transition: Transition.rightToLeft);
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 0),
              child: ListTile(
                visualDensity: const VisualDensity(vertical: 4),
                leading: const CircleAvatar(
                  maxRadius: 30,
                  backgroundColor: Colors.red,
                  backgroundImage: AssetImage('assets/images/dummy.jpg'),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Text(
                    "aniket",
                    style: CommonWidget.getTextStyle(
                        14, FontWeight.bold, Colors.white, context),
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Text(
                    "Lorem ipsum dolor sit",
                    style: CommonWidget.getTextStyle(
                        13, FontWeight.normal, subTitle, context),
                  ),
                ),
                trailing: Container(
                    child: Column(
                  children: [
                    Text(
                      "5:27 am",
                      style: CommonWidget.getTextStyle(12, FontWeight.bold,
                          const Color(0xff026500), context),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CircleAvatar(
                      maxRadius: 10,
                      backgroundColor: const Color(0xff026500),
                      child: Text(
                        '1',
                        style: CommonWidget.getTextStyle(
                            10, FontWeight.bold, Colors.white, context),
                      ),
                    ),
                  ],
                )),
              ),
            ),
          );
        },
      )),
    );
  }
}
