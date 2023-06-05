import 'package:json_annotation/json_annotation.dart';

part 'user_profile_for_share.g.dart';

@JsonSerializable()
class UserProfileForShare {
  @JsonKey(name: 'id')
  String userId;

  @JsonKey(name: 'username')
  String username;

  @JsonKey(name: 'profile_image')
  String? profileImage;

  @JsonKey(name: 'tamboon_point')
  int tamboonPoint;

  UserProfileForShare(
      {required this.userId,
        required this.username,
        required this.profileImage,
        required this.tamboonPoint});

  factory UserProfileForShare.fromJson(Map<String, dynamic> json) =>
      _$UserProfileForShareFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileForShareToJson(this);
}