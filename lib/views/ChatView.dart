import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp_clone/utils/constant_color.dart';

import '../controller/ChatsController.dart';
import '../widget/CommonWidget.dart';

class ChatView extends StatefulWidget {
  final user_id;
  final userData;
  const ChatView({super.key, required this.user_id, required this.userData});

  @override
  State<ChatView> createState() =>
      _ChatViewState(reciever_id: user_id, userData: userData);
}

class _ChatViewState extends State<ChatView> {
  final reciever_id;
  final userData;
  _ChatViewState({required this.reciever_id, required this.userData});
  final ChatsController _chatsController = ChatsController();
  var chatTextController = TextEditingController();
  var sender_id;

  @override
  void initState() {
    super.initState();
    getChatsHistory();
  }

  void getChatsHistory() async {
    print("click to user is $reciever_id");
    SharedPreferences pref = await SharedPreferences.getInstance();
    sender_id = pref.get("user_id");
    _chatsController.getChats(reciever_id);
    print(_chatsController.chatList);
  }

  // List<ChatMessage> messages = [
  //   ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
  //   ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
  //   ChatMessage(
  //       messageContent: "Hey Kriss, I am doing fine dude. wbu?",
  //       messageType: "sender"),
  //   ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
  //   ChatMessage(
  //       messageContent: "Is there any thing wrong?", messageType: "sender"),
  //   ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
  //   ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
  //   ChatMessage(
  //       messageContent: "Hey Kriss, I am doing fine dude. wbu?",
  //       messageType: "sender"),
  //   ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
  //   ChatMessage(
  //       messageContent: "Is there any thing wrong?", messageType: "sender"),
  //   ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
  //   ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
  //   ChatMessage(
  //       messageContent: "Hey Kriss, I am doing fine dude. wbu?",
  //       messageType: "sender"),
  //   ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
  //   ChatMessage(
  //       messageContent: "Is there any thing wrong?", messageType: "sender"),
  //   ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
  //   ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
  //   ChatMessage(
  //       messageContent: "Hey Kriss, I am doing fine dude. wbu?",
  //       messageType: "sender"),
  //   ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
  //   ChatMessage(
  //       messageContent: "Is there any thing wrong?", messageType: "sender"),
  //   ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
  //   ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
  //   ChatMessage(
  //       messageContent:
  //           "Hey Kriss, I am doing fiwcfsdsdjshdfgjshdgfjsh hsgdfhgshf sjdhfsjhfdg sjhfdgshfg ne dude. wbu?",
  //       messageType: "sender"),
  //   ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
  //   ChatMessage(
  //       messageContent: "Is there any thing wrong?", messageType: "sender"),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: primaryColor,
        toolbarHeight: 70,
        leadingWidth: 30,
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/dummy.jpg'),
              maxRadius: 25,
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userData.name!,
                  style: CommonWidget.getTextStyle(
                      17, FontWeight.w700, Colors.white, context),
                ),
                Text(
                  "Online",
                  style: CommonWidget.getTextStyle(
                      12, FontWeight.normal, Colors.white, context),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              print("video call");
            },
            icon: const Icon(Icons.video_call),
          ),
          IconButton(
            onPressed: () {
              print("call");
            },
            icon: const Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {
              print("option");
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 2),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 70,
              child: TextField(
                controller: chatTextController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.emoji_emotions),
                  prefixIconColor: const Color(0xff899AA2),
                  suffixIcon: SizedBox(
                    width: 150,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            print('add button pressed');
                          },
                          icon: const Icon(Icons.file_present),
                        ),
                        IconButton(
                          onPressed: () {
                            print('mic button pressed');
                          },
                          icon: const Icon(Icons.currency_rupee_rounded),
                        ),
                        IconButton(
                          onPressed: () {
                            print('mic button pressed');
                          },
                          icon: const Icon(Icons.camera_alt_sharp),
                        ),
                      ],
                    ),
                  ),
                  suffixIconColor: const Color(0xff899AA2),
                  hintText: "Message",
                  filled: true,
                  fillColor: recievedMsgBackgound,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(100)),
                  hintStyle: CommonWidget.getTextStyle(
                    18,
                    FontWeight.w300,
                    const Color(0xff8798A0),
                    context,
                  ),
                ),
                maxLines: 5,
                minLines: 1,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 5),
              child: InkWell(
                onTap: () async {
                  if (chatTextController.text.isNotEmpty) {
                    await _chatsController.sendMessage(
                        reciever_id, chatTextController.text);
                    setState(() {
                      chatTextController.clear();
                    });
                  }
                },
                child: CircleAvatar(
                  maxRadius: 25,
                  backgroundColor: primaryColor,
                  child: const Icon(Icons.send),
                ),
              ),
            )
          ],
        ),
      ),
      body: Container(
        // padding: const EdgeInsets.all(20),

        child: Obx(() {
          return ListView.builder(
            itemCount: _chatsController.chatList.length,
            itemBuilder: (context, index) {
              return Align(
                alignment:
                    _chatsController.chatList[index].senderId == sender_id
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: SingleChildScrollView(
                    child: BubbleSpecialOne(
                      text: _chatsController.chatList[index].message!,
                      textStyle: CommonWidget.getTextStyle(
                          14, FontWeight.bold, Colors.white, context),
                      isSender:
                          _chatsController.chatList[index].senderId == sender_id
                              ? true
                              : false,
                      color: _chatsController.chatList[index].receiverId ==
                              reciever_id
                          ? recievedMsgBackgound
                          : primaryColor,
                      tail: true,
                      seen: _chatsController.chatList[index].isSeen! == 1,
                      delivered: true,
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
