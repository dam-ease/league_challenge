// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return UserData(
    id: json['id'] as int?,
    avatar: (json['avatar'])
        .map((e) => Avata.fromJson(e as Map<String, dynamic>))
        .toList(),
    name: json['name'] as String?,
    username: json['username'] as String?,
  );
}

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'avatar': instance.id,
      'name': instance.name,
      'username': instance.username,
    };
