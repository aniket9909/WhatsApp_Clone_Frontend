import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/controller/User_controller.dart';
import 'package:whatsapp_clone/widget/CommonWidget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SsplashScreenState();
}

class SsplashScreenState extends State<SplashScreen> {
  final User_controller _userController = Get.put(User_controller());
  @override
  void initState() {
    super.initState();
    _userController.getUser();
    Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(
              context,
              '/',
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff18262E),
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SvgPicture.asset('logo.svg'),
              Image.asset('assets/images/logo.png'),
              Text(
                "WhatsApp",
                style: CommonWidget.getTextStyle(
                    35, FontWeight.w500, Colors.white, context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
