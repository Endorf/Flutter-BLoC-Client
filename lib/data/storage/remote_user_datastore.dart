import 'package:bloc_app/data/api/auth_api.dart';
import 'package:bloc_app/data/entity/remote_user.dart';
import 'package:bloc_app/service_locator.dart';
import 'package:multiple_result/multiple_result.dart';

class RemoteUserDataStore {
  final api = locator<AuthApi>();

  Future<Result<RemoteUser, Exception>> authenticate(String email) async {
    return await api.login(email);
  }
}
