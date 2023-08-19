part of models;

class ConversationModel {
  final UserModel user;
  final String connectionId;
  final String lastMessage;
  final DateTime lastMessageTime;

  ConversationModel(
      {required this.user,
      required this.lastMessage,
      required this.connectionId,
      required this.lastMessageTime});

  factory ConversationModel.fromJson(Map<String, dynamic> json) =>
      ConversationModel(
        user: UserModel.fromJson(json['user']),
        connectionId: json['connection_id'],
        lastMessage: json['last_message'],
        lastMessageTime: json['last_message_time'],
      );

  factory ConversationModel.fromDynamic(Map<dynamic, dynamic> json) =>
      ConversationModel(
        user: UserModel.fromDynamic(json['user']),
        connectionId: json['connectionId'],
        lastMessage: json['lastMessage'],
        lastMessageTime: json['lastMessageTime'],
      );
}
