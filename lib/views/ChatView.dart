import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/utils/constant_color.dart';

import '../models/ChatMsg.dart';
import '../widget/CommonWidget.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(
        messageContent:
            "Hey Kriss, I am doing fiwcfsdsdjshdfgjshdgfjsh hsgdfhgshf sjdhfsjhfdg sjhfdgshfg ne dude. wbu?",
        messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];

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
                  "aniket",
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
              child: CircleAvatar(
                maxRadius: 25,
                backgroundColor: primaryColor,
                child: const Icon(Icons.mic),
              ),
            )
          ],
        ),
      ),
      body: Container(
        // padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            return Align(
              alignment: messages[index].messageType == "receiver"
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: SingleChildScrollView(
                  child: BubbleSpecialOne(
                    text: messages[index].messageContent,
                    textStyle: CommonWidget.getTextStyle(
                        14, FontWeight.bold, Colors.white, context),
                    isSender: messages[index].messageType == "receiver"
                        ? false
                        : true,
                    color: messages[index].messageType == "receiver"
                        ? recievedMsgBackgound
                        : primaryColor,
                    tail: true,
                    delivered: true,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
