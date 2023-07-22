// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteNote _$RemoteNoteFromJson(Map<String, dynamic> json) => RemoteNote(
      json['id'] as int,
      json['title'] as String,
      json['body'] as String,
    );

Map<String, dynamic> _$RemoteNoteToJson(RemoteNote instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
