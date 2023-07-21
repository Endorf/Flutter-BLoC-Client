import 'package:bloc_app/data/entity/remote_user.dart';
import 'package:bloc_app/data/storage/remote_datastore.dart';
import 'package:bloc_app/service_locator.dart';
import 'package:multiple_result/multiple_result.dart';

class AuthRepository {
  final datastore = locator<RemoteDataStore>();

  Future<Result<RemoteUser, Exception>> authenticate(String email) async {
    return datastore.authenticate(email);
  }
}
