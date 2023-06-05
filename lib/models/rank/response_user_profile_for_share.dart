import 'package:gift2grow/models/rank/user_profile_for_share.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response_user_profile_for_share.g.dart';

@JsonSerializable()
class ResponseUserProfileForShare {
  @JsonKey(name: 'success') 
  bool success; 

  @JsonKey(name: 'data')
  UserProfileForShare data;

 

  ResponseUserProfileForShare(
      {required this.success,
        required this.data,
        });

  factory ResponseUserProfileForShare.fromJson(Map<String, dynamic> json) =>
      _$ResponseUserProfileForShareFromJson(json);
// เปลี่ยนเป็นชื่อclassของเราด้านบน + FromJson

  Map<String, dynamic> toJson() => _$ResponseUserProfileForShareToJson(this);
// เปลี่ยนเป็นชื่อclassของเราด้านบน + ToJson
}