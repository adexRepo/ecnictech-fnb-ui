// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      id: json['id'] as String,
      username: json['username'] as String,
      nickName: json['nickName'] as String,
      password: json['password'] as String,
      userStatus: json['userStatus'] as String,
      userRoles:
          (json['userRoles'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'nickName': instance.nickName,
      'password': instance.password,
      'userStatus': instance.userStatus,
      'userRoles': instance.userRoles,
    };
