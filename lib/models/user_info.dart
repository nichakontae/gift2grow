import 'package:image_picker/image_picker.dart';

class UserInfo {
  String? userId;
  String userName;
  String? profileImage;
  XFile? profileImageFile;
  String firstName;
  String lastName;
  String email;

  UserInfo({
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.email,
  });
}
