import 'package:encrypt/encrypt.dart';
import 'package:gift2grow/models/authentication/success_auth.dart';
import 'package:gift2grow/utilities/caller.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      final response = await Caller.dio.get("/auth/getKey");
      SuccessAuth d = SuccessAuth.fromJson(response.data);
      _secretKey = d.data;
    }
  }

  //
  static Future<String?> getData({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future storeData({required String key, required String value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static void clearUser() {
    _userId = "";
    _secretKey = "";
  }
}
