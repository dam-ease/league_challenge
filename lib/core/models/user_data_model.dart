import 'package:json_annotation/json_annotation.dart';
import 'package:league_challenge/core/models/avata_model.dart';

part 'user_data_model.g.dart';

@JsonSerializable()
class UserData {
  int? id;
  Avata? avatar;
  String? name;
  String? username;
  UserData({this.id, this.avatar, this.name, this.username});
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
