import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:whatsapp_clone/models/UserChatsModel.dart';
import 'package:whatsapp_clone/models/UserModel.dart';

class URL {
  static const baseUrl = "http://127.0.0.1:8000/api/";
}

class ApiService {
  static var client = http.Client();
  static getUser() async {
    try {
      print('${URL.baseUrl}users');
      var response = await client
          .post(Uri.parse('${URL.baseUrl}users'), headers: {'user_id': '1'});
      var decodeBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (decodeBody['error'] == false) {
          print('success');
          print(decodeBody);
          return UserModel.fromJson(decodeBody);
        } else {
          return "error";
        }
      } else {
        print('error status code ${response.statusCode}');
      }
    } catch (e) {
      print("this is erro from api");
      print(e);
    }
  }

  static getUserChats(userId) async {
    try {
      print('${URL.baseUrl}getUserChats');
      var response = await client.get(Uri.parse('${URL.baseUrl}getUserChats'),
          headers: {'user_id': userId.toString()});
      var decodeBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (decodeBody['error'] == false) {
          print('userChats Data success');
          print(decodeBody);
          return UserChatsModel.fromJson(decodeBody);
        } else {
          return "error";
        }
      } else {
        print('error status code ${response.statusCode}');
      }
    } catch (e) {
      print("this is erro from api");
      print(e);
    }
  }
}
