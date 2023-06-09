import 'package:encrypt/encrypt.dart';
import 'package:gift2grow/models/authentication/success_auth.dart';
import 'package:gift2grow/utilities/caller.dart';

class UserProvider {
  static String _userId = "";
  static String _secretKey = "";
  static Encrypted? _encrypt;

  String get userId => _userId;

  static void setUserDetails(
      {required String userId, required String password}) {
    _userId = userId;
    _encrypt = encryptPassword(password);
  }

  static Encrypted encryptPassword(String password) {
    final plainText = password;
    final key = Key.fromUtf8(_secretKey.substring(0, 16));
    final iv = IV.fromUtf8(_secretKey.substring(0, 16));
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    return encrypter.encrypt(plainText, iv: iv);
  }

  static String decrypt() {
    final key = Key.fromUtf8(_secretKey.substring(0, 16));
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final iv = IV.fromUtf8(_secretKey.substring(0, 16));
    return encrypter.decrypt(_encrypt!, iv: iv);
  }

  // set from Register
  static void setKey({required String key}) {
    _secretKey = key;
  }

  // set from login
  static Future setKeySpecialCase() async {
    if (_secretKey == "") {
      print("hi");
      final response = await Caller.dio.get("/auth/getKey");
      SuccessAuth d = SuccessAuth.fromJson(response.data);
      _secretKey = d.data;
      print(_secretKey);
    }
  }

  static void clearUser() {
    _userId = "";
    _secretKey = "";
  }
}
