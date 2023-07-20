import 'package:bloc_app/data/api/auth_api.dart';
import 'package:bloc_app/data/entity/remote_user.dart';

class RemoteDataStore {
  final api = AuthApi();

  Future<RemoteUser> authenticate(String email) async {
    return await api.login(email);
  }
}
