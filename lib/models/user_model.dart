part of models;

class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String userName;
  final DateTime createdAt;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.userName,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        phoneNumber: json['phone_no'],
        userName: json['user_name'],
        createdAt: DateTime.parse(json["created_at"]),
      );

  factory UserModel.fromDynamic(Map<dynamic, dynamic> json) => UserModel(
        id: json['id'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        phoneNumber: json['phone_no'],
        userName: json['user_name'],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'phone_no': phoneNumber,
        'user_name': userName,
      };
}
