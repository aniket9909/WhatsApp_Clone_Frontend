import 'package:get/get.dart';
import 'package:whatsapp_clone/routes/pages.dart';
import 'package:whatsapp_clone/views/SplashScreen.dart';

import '../views/HomeScreen.dart';

class Pages {
  static var list = [
    GetPage(name: Routes.firstEntry, page: () => const HomeScreen()),
    GetPage(name: Routes.splashScreen, page: () => const SplashScreen())
  ];
}
