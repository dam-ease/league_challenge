import 'package:json_annotation/json_annotation.dart';

part 'avata_model.g.dart';

@JsonSerializable()
class Avata {
  String? large;
  String? medium;
  String? thumbnail;

  Avata({this.large, this.medium, this.thumbnail});
  factory Avata.fromJson(Map<String, dynamic> json) => _$AvataFromJson(json);

  Map<String, dynamic> toJson() => _$AvataToJson(this);
}
