import 'package:json_annotation/json_annotation.dart';

part 'success_auth.g.dart';

@JsonSerializable()
class SuccessAuth {
  @JsonKey(name: 'success')
  bool success;

  @JsonKey(name: 'data')
  String data;

  SuccessAuth({
    required this.success,
    required this.data,
  });

  factory SuccessAuth.fromJson(Map<String, dynamic> json) =>
      _$SuccessAuthFromJson(json);

  Map<String, dynamic> toJson() => _$SuccessAuthToJson(this);
  
}
