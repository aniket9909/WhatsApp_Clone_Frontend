import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp_clone/api/api_service.dart';
import 'package:whatsapp_clone/models/ChatMsg.dart';

class ChatsController extends GetxController {
  var chatList = List<ChatMessage>.empty().obs;
  void getChats(recieverId) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var chatMessage = await ApiService.getChat(
          preferences.get('user_id'), recieverId.toString());
      if (chatMessage != null) {
        print(chatMessage);
        var data = chatMessage.data!;
        chatList.assignAll(data);
      }
      print("data success from chat controller");
    } catch (e) {
      print("error in data fetching from chat controller $e");
    }
  }

  sendMessage(recieverId, message) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var chatMessage = await ApiService.sendMessage(
          preferences.get('user_id'), recieverId.toString(), message);
      if (chatMessage != null) {
        print(chatMessage.data!);

        var sendMessage = chatMessage.data!;
        var convert = ChatMessage(
          id: sendMessage.id,
          senderId: int.tryParse(sendMessage.senderId ?? ""),
          receiverId: int.tryParse(sendMessage.receiverId ?? ""),
          message: sendMessage.message,
          isSeen: sendMessage.isSeen == true ? 1 : 0,
          createdAt: sendMessage.createdAt,
          updatedAt: sendMessage.updatedAt,
        );
        return chatList.add(convert);
      }
      print("data success from chat controller");
    } catch (e) {
      print("error in data fetching from chat controller $e");
    }
  }
}
