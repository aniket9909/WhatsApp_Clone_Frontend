import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/routes/pages.dart';
import 'package:whatsapp_clone/routes/routes.dart';
import 'package:whatsapp_clone/widget/MyThem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.splashScreen,
      debugShowCheckedModeBanner: false,
      getPages: Pages.list,
      themeMode: ThemeMode.dark,
      theme: MyTheme.lightThem(context),
      darkTheme: MyTheme.darkThem(context),
    );
  }
}
