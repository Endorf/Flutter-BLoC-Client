import 'package:bloc_app/data/entity/remote_user.dart';
import 'package:bloc_app/data/storage/remote_datastore.dart';

class AuthRepository {
  // use DI
  final datastore = RemoteDataStore();

  Future<RemoteUser> authenticate(String email) async {
    return datastore.authenticate(email);
  }
}
