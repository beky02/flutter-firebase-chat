
import 'package:firebase_chat/models/message_model.dart';
import 'package:firebase_chat/models/user_model.dart';

class ConversationModel {
  UserModel user;
  MessageModel message;
  int connectionId;

  ConversationModel({this.user, this.message, this.connectionId});

  factory ConversationModel.fromJson(Map<String, dynamic> json) =>
      ConversationModel(
        user: json['user'] == null ? null : UserModel.fromJson(json['user']),
        message: json['message'] == null
            ? null
            : MessageModel.fromJson(json['message']),
        connectionId: json['connection_id'],
      );


      factory ConversationModel.fromDynamic(Map<dynamic, dynamic> json) => ConversationModel(
     
      // user: UserModel.fromDynamic(json['user']),
      message: MessageModel.fromDynamic(json['messages']),
      connectionId: json['connectionId'],
      );
}


