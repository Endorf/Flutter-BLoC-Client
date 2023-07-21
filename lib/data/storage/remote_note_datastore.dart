import 'package:bloc_app/data/api/notes_api.dart';
import 'package:bloc_app/data/entity/remote_note.dart';
import 'package:bloc_app/service_locator.dart';
import 'package:multiple_result/multiple_result.dart';

class RemoteNoteDataStore {
  final api = locator<NotesApi>();

  Future<Result<List<RemoteNote>, Exception>> notes() async {
    return await api.notes();
  }
}
