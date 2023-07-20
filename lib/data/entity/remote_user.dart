import 'package:json_annotation/json_annotation.dart';

// part 'remote_user.g.dart';

@JsonSerializable()
class RemoteUser {
  final int userId;
  final String email;
  final String username;
  final String name;

  RemoteUser(this.userId, this.email, this.username, this.name);

  // factory RemoteUser.fromJson(Map<String, dynamic> json) =>
  //     _$RemoteUserFromJson(json);

  // Map<String, dynamic> toJson() => _$RemoteUserToJson(this);
}
