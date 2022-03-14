class NotesUserModel {
  String? name;
  String? university;
  String? phone;
  String? password;
  String? uId;
  bool? isEmailVerified;
  NotesUserModel({
    this.name,
    this.university,
    this.password,
    this.phone,
    this.uId,
    this.isEmailVerified,
  });

  NotesUserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    university = json['university'];
    phone = json['phone'];
    password = json['password'];
    uId = json['uId'];
    isEmailVerified = json['isEmailVerified'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'university': university,
      'phone': phone,
      'password': password,
      'isEmailVerified': isEmailVerified,
    };
  }
}
