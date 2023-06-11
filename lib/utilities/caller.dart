import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_alert/flutter_platform_alert.dart';

class Caller {
  static BaseOptions options = BaseOptions(
    // 127.0.0.1 -> localhost -> when using IOS emulator
    // 10.0.2.2 or IP of your network -> when using android emulator
    baseUrl: "http://server1.ivelse.com:8080/api",
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 10),
  );

  static Dio dio = Dio(options);

  static setToken(String token) {
    dio.options.headers["Authorization"] = "Bearer $token";
  }

  static handle(BuildContext context, DioError error) {
    if (error.response == null) {
      FlutterPlatformAlert.showAlert(windowTitle: 'Something went wrong', text: error.message!);
      return;
    }

    SnackBar snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(15),
      backgroundColor: const Color(0xffB00020),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(error.response!.data["message"]),
          error.response!.data["error"] == null
              ? Container()
              : Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    error.response!.data["error"],
                    style: const TextStyle(color: Colors.white70),
                  ),
                ),
        ],
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static error(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(15),
      backgroundColor: const Color(0xffB00020),
      content: Text(message),
    ));
  }

  static inform(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(15),
      content: Text(message),
    ));
  }
}
