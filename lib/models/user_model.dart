class UserModel {
  String id;
  String firstName;
  String lastName;
  String phoneNumber;
  String userName;
  DateTime createdAt;

  static UserModel userModel;
  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.userName,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        phoneNumber: json['phone_no'],
        userName: json['user_name'],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'phone_no': phoneNumber,
        'user_name': userName,
      };
}
