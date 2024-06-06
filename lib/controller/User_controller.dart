import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp_clone/api/api_service.dart';
import 'package:whatsapp_clone/models/UserChatsModel.dart';
import 'package:whatsapp_clone/models/UserModel.dart';

class User_controller extends GetxController {
  Future<dynamic> getUser() async {
    var data = Data();
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      print('in controller');
      var response1 = await ApiService.getUser();
      if (response1 != null) {
        data = response1.data!;
        pref.setString('user_data', jsonEncode(data));
        pref.setInt('user_id', data.id!);
        print(pref.getString('user_data'));
      }
    } catch (e) {
      print("from controller error");
      print(e);
    }
  }

  var userChatList = List<ChatDataList>.empty().obs;
  var isLoading = false.obs;
  Future<dynamic> getUserChats() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      isLoading = true.obs;
      print('in getuserData controller');
      var response1 = await ApiService.getUserChats(pref.getInt('user_id'));
      if (response1 != null) {
        var data = response1.data!;
        print("get userchats sucess from the controller function");
        userChatList.assignAll(data);
        isLoading = false.obs;
        return userChatList;
      }
    } catch (e) {
      print("from get chat User controller error");
      print(e);
    }
  }
}
