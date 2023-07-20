import 'dart:io';

import 'package:bloc_app/data/entity/remote_user.dart';
import 'package:dio/dio.dart';

class AuthApi {
  static const String url = "";
  final _client = Dio();

  Future<RemoteUser> login(String email) async {
    var payload = {
      "email": email,
    };

    try {
      final Response response = await _client.get(
        url,
        data: payload,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
      );

      // return RemoteUser.fromJson(response.data);
      return RemoteUser(1, "sd", "as", "as");
    } catch (e) {
      Exception('Something went wrong: $e');
      return RemoteUser(2, "NULL", "as", "as");
    }
  }
}
