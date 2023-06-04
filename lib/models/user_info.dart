import 'package:image_picker/image_picker.dart';

class MyUserInfo {
  String? userId;
  String userName;
  String? profileImage;
  XFile? profileImageFile;
  String firstName;
  String lastName;
  String email;

  MyUserInfo({
    this.userId,
    this.profileImage,
    this.profileImageFile,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.email,
  });
}
