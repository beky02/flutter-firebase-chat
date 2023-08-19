part of models;

class MessageModel {
  String id;
  String senderId;
  String receiverId;
  String? connectionId;
  String text;
  bool seen;

  MessageModel(
      {required this.id,
      required this.senderId,
      required this.receiverId,
      required this.connectionId,
      required this.text,
      required this.seen});

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
      id: json['id'],
      senderId: json['sender_id'],
      receiverId: json['receiver_id'],
      connectionId: json['connection_id'],
      text: json['text'],
      seen: json['seen']);
  factory MessageModel.fromDynamic(Map<dynamic, dynamic> json) => MessageModel(
      id: json['id'],
      senderId: json['senderId'],
      connectionId: json['connectionId'],
      receiverId: json['receiverId'],
      text: json['text'],
      seen: json['seen']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "senderId": senderId,
        "receiverId": receiverId,
        "connectionId": connectionId,
        "text": text,
        "seen": seen,
      };
}
