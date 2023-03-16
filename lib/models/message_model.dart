class MessageModel {
  String id;
  String senderId;
  String receiverId;
  String connectionId;
  String text;
  bool seen;

  MessageModel(
      {this.id,
      this.senderId,
      this.receiverId,
      this.connectionId,
      this.text,
      this.seen});

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
        "id": id == null ? null : id,
        "senderId": senderId == null ? null : senderId,
        "receiverId": receiverId == null ? null : receiverId,
        "connectionId": connectionId == null ? null : connectionId,
        "text": text == null ? null : text,
        "seen": seen == null ? null : seen,
      };
}
