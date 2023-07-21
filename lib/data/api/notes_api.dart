import 'dart:io';
import 'package:bloc_app/data/entity/remote_note.dart';
import 'package:dio/dio.dart';
import 'package:multiple_result/multiple_result.dart';

class NotesApi {
  static const String url = "";

  final _client = Dio();

  Future<Result<List<RemoteNote>, Exception>> notes() async {
    try {
      final Response response = await _client.get(
        url,
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
      );

      if (_isSuccess(response.statusCode)) {
        return Result.success(listOfNotes(response.data));
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
