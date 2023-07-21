// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bloc_app/data/api/auth_api.dart' as _i3;
import 'package:bloc_app/data/di.dart' as _i8;
import 'package:bloc_app/data/repository/auth_repository.dart' as _i4;
import 'package:bloc_app/data/repository/fake_repository.dart' as _i6;
import 'package:bloc_app/data/storage/remote_datastore.dart' as _i7;
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dataModule = _$DataModule();
    gh.singleton<_i3.AuthApi>(dataModule.authApi);
    gh.factory<_i4.AuthRepository>(() => dataModule.authRepository);
    gh.singleton<_i5.Dio>(dataModule.dio());
    gh.factory<_i6.FakeRepository>(() => dataModule.fakeRepository);
    gh.singleton<_i7.RemoteDataStore>(dataModule.remoteDataStore);
    return this;
  }
}

class _$DataModule extends _i8.DataModule {}
