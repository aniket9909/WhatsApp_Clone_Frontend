import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/controller/User_controller.dart';
import 'package:whatsapp_clone/models/UserChatsModel.dart';
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
  var chatsList = List<ChatDataList>.empty();
  @override
  void initState() {
    super.initState();
    getUserChatsList();
  }

  void getUserChatsList() async {
    await _userController.getUserChats();

    print("this is from chat page");
    print(chatsList);
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Obx(() {
      return Container(
        child: !_userController.isLoading.value
            ? ListView.builder(
                itemCount: _userController.userChatList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      print(
                          "click to user ${_userController.userChatList[index].id!}");
                      // Get.to(
                      //     () => ChatView(
                      //           user_id:
                      //               _userController.userChatList[index].id!,
                      //           userData: _userController.userChatList[index],
                      //         ),
                      //     transition: Transition.rightToLeft);
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return ChatView(
                            user_id: _userController.userChatList[index].id!,
                            userData: _userController.userChatList[index],
                          );
                        },
                      ));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 0),
                      child: ListTile(
                        visualDensity: const VisualDensity(vertical: 4),
                        leading: const CircleAvatar(
                          maxRadius: 30,
                          backgroundColor: Colors.red,
                          backgroundImage:
                              AssetImage('assets/images/dummy.jpg'),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: Text(
                            _userController.userChatList[index].name!,
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
                              style: CommonWidget.getTextStyle(
                                  12,
                                  FontWeight.bold,
                                  const Color(0xff026500),
                                  context),
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
              )
            : Center(
                child: Text(
                  "Loading",
                  style: CommonWidget.getTextStyle(
                      13, FontWeight.normal, subTitle, context),
                ),
              ),
      );
    }));
  }
}
