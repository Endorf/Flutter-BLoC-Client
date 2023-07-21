import 'package:bloc_app/data/api/auth_api.dart';
import 'package:bloc_app/data/repository/auth_repository.dart';
import 'package:bloc_app/data/repository/fake_repository.dart';
import 'package:bloc_app/data/storage/remote_datastore.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DataModule {
  @singleton
  Dio dio() => Dio();

  @singleton
  AuthApi get authApi => AuthApi();

  @singleton
  RemoteDataStore get remoteDataStore => RemoteDataStore();

  @injectable
  AuthRepository get authRepository => AuthRepository();

  @injectable
  FakeRepository get fakeRepository => FakeRepository();
}
