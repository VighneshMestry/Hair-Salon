class UserModel {
  String phoneNumber;
  String uid;
  String createdAt;

  UserModel({
    required this.phoneNumber,
    required this.uid,
    required this.createdAt,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      phoneNumber: map["phoneNumber"] ?? ' ',
      uid: map["uid"] ?? ' ',
      createdAt: map["createdAt"] ?? ' ',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "phoneNumber" : phoneNumber,
      "uid" : uid,
      "createAt" : createdAt,
    };
  }
}


