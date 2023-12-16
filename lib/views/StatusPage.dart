import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/src/badge.dart' as badge;
import 'package:whatsapp_clone/utils/constant_color.dart';
import 'package:whatsapp_clone/views/ChatView.dart';

import '../widget/CommonWidget.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({super.key});

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          child: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return index == 0
              ? InkWell(
                  onTap: () {
                    print("call");
                    Get.to(() => const ChatView(),
                        transition: Transition.rightToLeft);
                  },
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 0),
                        child: ListTile(
                          visualDensity: const VisualDensity(vertical: 4),
                          leading: Container(
                            margin: const EdgeInsets.all(5),
                            child: badge.Badge(
                              badgeStyle: BadgeStyle(badgeColor: primaryColor),
                              badgeContent:
                                  const Icon(Icons.add, color: Colors.white),
                              position: BadgePosition.bottomEnd(),
                              child: CircleAvatar(
                                maxRadius: 30,
                                backgroundColor: primaryColor,
                                backgroundImage:
                                    const AssetImage('assets/images/dummy.jpg'),
                              ),
                            ),
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Text(
                              "Mu Status",
                              style: CommonWidget.getTextStyle(
                                  18, FontWeight.bold, Colors.white, context),
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Text(
                              "tap to add status updates",
                              style: CommonWidget.getTextStyle(
                                  14, FontWeight.bold, subTitle, context),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Recent updates",
                            style: CommonWidget.getTextStyle(
                                12, FontWeight.w500, subTitle, context),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : InkWell(
                  onTap: () {
                    print("call");
                    Get.to(() => const ChatView(),
                        transition: Transition.rightToLeft);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 0),
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
                              18, FontWeight.bold, Colors.white, context),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Text(
                          "today 12:21",
                          style: CommonWidget.getTextStyle(
                              14, FontWeight.bold, subTitle, context),
                        ),
                      ),
                    ),
                  ),
                );
        },
      )),
    );
  }
}
