import 'package:bloc_app/data/entity/remote_note.dart';
import 'package:bloc_app/data/storage/remote_note_datastore.dart';
import 'package:bloc_app/service_locator.dart';
import 'package:multiple_result/multiple_result.dart';

class NoteRepository {
  final datastore = locator<RemoteNoteDataStore>();

  Future<Result<List<RemoteNote>, Exception>> notes() async {
    return datastore.notes();
  }
}
