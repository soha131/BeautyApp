class AppUser {
  String uid = '';
  String email = '';
  String fullName = '';
  String phoneNumber = '';

  AppUser(
      {required this.uid,
        required this.email,
        required this.fullName,
        required this.phoneNumber,
        });

  AppUser.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    email = json['email'];
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String,dynamic>toJson() {
    return {
      'uid': uid,
      'email': email,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
    };
  }
}
