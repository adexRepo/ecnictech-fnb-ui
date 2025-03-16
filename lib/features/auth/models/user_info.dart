import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart'; // For user_info.dart

@JsonSerializable()
class UserInfo {
  final String id;
  final String username;
  final String nickName;
  final String password;
  final String userStatus;
  final List<String> userRoles;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  UserInfo(
      {required this.id,
      required this.username,
      required this.nickName,
      required this.password,
      required this.userStatus,
      required this.userRoles});

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}

class UserInfoAdapter extends TypeAdapter<UserInfo> {
  @override
  final int typeId = 1;

  @override
  UserInfo read(BinaryReader reader) {
    return UserInfo(
      id: reader.readString(),
      username: reader.readString(),
      nickName: reader.readString(),
      password: reader.readString(),
      userStatus: reader.readString(),
      userRoles: reader.readStringList(),
    );
  }

  @override
  void write(BinaryWriter writer, UserInfo obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.username);
    writer.writeString(obj.nickName);
    writer.writeString(obj.password);
    writer.writeString(obj.userStatus);
    writer.writeList(obj.userRoles);
  }
}
