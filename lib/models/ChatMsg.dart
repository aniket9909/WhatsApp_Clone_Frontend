class ChatMessagesModel {
  int? status;
  bool? error;
  List<ChatMessage>? data;

  ChatMessagesModel({this.status, this.error, this.data});

  ChatMessagesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    if (json['data'] != null) {
      data = <ChatMessage>[];
      json['data'].forEach((v) {
        data!.add(ChatMessage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['error'] = error;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChatMessage {
  int? id;
  int? senderId;
  int? receiverId;
  String? message;
  int? isSeen;
  String? createdAt;
  String? updatedAt;

  ChatMessage(
      {this.id,
      this.senderId,
      this.receiverId,
      this.message,
      this.isSeen,
      this.createdAt,
      this.updatedAt});

  ChatMessage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
    message = json['message'];
    isSeen = json['is_seen'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sender_id'] = senderId;
    data['receiver_id'] = receiverId;
    data['message'] = message;
    data['is_seen'] = isSeen;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
