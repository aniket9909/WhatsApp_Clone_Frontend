import 'package:flutter/material.dart';
import 'package:whatsapp_clone/utils/constant_color.dart';

import '../widget/CommonWidget.dart';

class CallsPage extends StatefulWidget {
  const CallsPage({super.key});

  @override
  State<CallsPage> createState() => _CallsPageState();
}

class _CallsPageState extends State<CallsPage> {
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
                            child: CircleAvatar(
                              maxRadius: 30,
                              backgroundColor: primaryColor,
                              child: const Icon(
                                Icons.link_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          title: Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Text(
                              "Create call link",
                              style: CommonWidget.getTextStyle(
                                  18, FontWeight.bold, Colors.white, context),
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Text(
                              "Share a link for your WhatsApp call",
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
                            "Recent ",
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
                      trailing: Icon(
                        Icons.phone,
                        color: primaryColor,
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Text(
                          "1321654132",
                          style: CommonWidget.getTextStyle(
                              18, FontWeight.bold, Colors.white, context),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.call_received,
                              size: 14,
                              color: Colors.green,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              "today 12:21",
                              style: CommonWidget.getTextStyle(
                                  14, FontWeight.bold, subTitle, context),
                            ),
                          ],
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
