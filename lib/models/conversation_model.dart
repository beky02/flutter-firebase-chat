part of models;

class ConversationModel {
  final UserModel user;
  final MessageModel message;
  final int connectionId;

  ConversationModel(
      {required this.user, required this.message, required this.connectionId});

  factory ConversationModel.fromJson(Map<String, dynamic> json) =>
      ConversationModel(
        user: UserModel.fromJson(json['user']),
        message: MessageModel.fromJson(json['message']),
        connectionId: json['connection_id'],
      );

  factory ConversationModel.fromDynamic(Map<dynamic, dynamic> json) =>
      ConversationModel(
        user: UserModel.fromDynamic(json['user']),
        message: MessageModel.fromDynamic(json['messages']),
        connectionId: json['connectionId'],
      );
}
