import 'dart:io';

import 'package:bloc_app/data/entity/remote_user.dart';
import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';

class AuthApi {
  static const String url = "";
  final _client = Dio();

  Future<Result<RemoteUser, Exception>> login(String email) async {
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

      if (_isSuccess(response.statusCode)) {
        return Result.success(RemoteUser.fromJson(response.data));
      } else {
        return Result.error(Exception(response.statusMessage));
      }
    } catch (e) {
      return Result.error(Exception('Something went wrong: $e'));
    }
  }

  bool _isSuccess(statusCode) =>
      statusCode != null || statusCode >= 200 && statusCode < 300;
}
