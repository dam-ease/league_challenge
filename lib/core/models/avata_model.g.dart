// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avata_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Avata _$AvataFromJson(Map<String, dynamic> json) {
  return Avata(
    large: json['large'] as String?,
    medium: json['medium'] as String?,
    thumbnail: json['thumbnail'] as String?,
  );
}

Map<String, dynamic> _$AvataToJson(Avata instance) => <String, dynamic>{
      'large': instance.large,
      'medium': instance.medium,
      'thumbnail': instance.thumbnail,
    };
