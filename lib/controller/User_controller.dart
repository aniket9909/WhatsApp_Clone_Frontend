import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp_clone/api/api_service.dart';
import 'package:whatsapp_clone/models/UserModel.dart';

class User_controller extends GetxController {
  var data = Data();

  Future<dynamic> getUser() async {
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

  Future<dynamic> getUserChats() async {
    var userList = List<Data>.empty();
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      print('in getuserData controller');
      var response1 = await ApiService.getUserChats(pref.getInt('user_id'));
      if (response1 != null) {
        print(response1.data);
        data = response1.data!;
        print(data);
        // userList = data as List<Data>;
      }
    } catch (e) {
      print("from controller error");
      print(e);
    }
  }
}
