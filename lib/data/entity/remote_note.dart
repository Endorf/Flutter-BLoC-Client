import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_note.g.dart';

List<RemoteNote> listOfNotes(List<dynamic> listData) =>
    List<RemoteNote>.from(listData.map((x) => RemoteNote.fromJson(x)));

@JsonSerializable()
class RemoteNote {
  final int id;
  final String title;
  final String body;

  RemoteNote(this.id, this.title, this.body);

  factory RemoteNote.fromJson(Map<String, dynamic> json) =>
      _$RemoteNoteFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteNoteToJson(this);
}
