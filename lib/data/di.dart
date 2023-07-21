import 'package:bloc_app/data/api/auth_api.dart';
import 'package:bloc_app/data/api/notes_api.dart';
import 'package:bloc_app/data/repository/auth_repository.dart';
import 'package:bloc_app/data/repository/fake_repository.dart';
import 'package:bloc_app/data/repository/notes_repository.dart';
import 'package:bloc_app/data/storage/remote_note_datastore.dart';
import 'package:bloc_app/data/storage/remote_user_datastore.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DataModule {
  // API
  @singleton
  AuthApi get authApi => AuthApi();

  @singleton
  NotesApi get notesApi => NotesApi();

  // Data store
  @singleton
  RemoteUserDataStore get remoteUserDataStore => RemoteUserDataStore();

  @singleton
  RemoteNoteDataStore get remoteNoteDataStore => RemoteNoteDataStore();

  // Repository
  @injectable
  AuthRepository get authRepository => AuthRepository();

  @injectable
  NoteRepository get noteRepository => NoteRepository();

  @injectable
  FakeRepository get fakeRepository => FakeRepository();
}
