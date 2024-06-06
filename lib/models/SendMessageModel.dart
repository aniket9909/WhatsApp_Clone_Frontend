class SendMessageModel {
  int? status;
  bool? error;
  String? message;
  SendMessage? data;

  SendMessageModel({this.status, this.error, this.message, this.data});

  SendMessageModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    message = json['message'];
    data = json['data'] != null ? SendMessage.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['error'] = error;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class SendMessage {
  String? senderId;
  String? receiverId;
  String? message;
  bool? isSeen;
  String? updatedAt;
  String? createdAt;
  int? id;

  SendMessage(
      {this.senderId,
      this.receiverId,
      this.message,
      this.isSeen,
      this.updatedAt,
      this.createdAt,
      this.id});

  SendMessage.fromJson(Map<String, dynamic> json) {
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
    message = json['message'];
    isSeen = json['is_seen'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sender_id'] = senderId;
    data['receiver_id'] = receiverId;
    data['message'] = message;
    data['is_seen'] = isSeen;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
