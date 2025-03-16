import 'package:json_annotation/json_annotation.dart';

import 'user_info.dart';

part 'user_credential.g.dart';

@JsonSerializable()
class UserCredential {
  final String? token;
  final UserInfo? userInfo;

  const UserCredential({required this.token, this.userInfo});

  factory UserCredential.fromJson(Map<String, dynamic> json) =>
      _$UserCredentialFromJson(json);

  Map<String, dynamic> toJson() => _$UserCredentialToJson(this);
}
