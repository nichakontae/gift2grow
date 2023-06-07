import 'package:json_annotation/json_annotation.dart';

part 'ranking_users.g.dart';

@JsonSerializable()
class RankingUsers {
  @JsonKey(name: 'userId')
  String userId;

  @JsonKey(name: 'username')
  String username;

  @JsonKey(name: 'profile_image')
  String? profileImage;

  @JsonKey(name: 'rank')
  String rank;

  @JsonKey(name: 'tamboon_point')
  int tamboonPoint;

  RankingUsers(
      {required this.userId,
      required this.username,
      required this.profileImage,
      required this.rank,
      required this.tamboonPoint});

  factory RankingUsers.fromJson(Map<String, dynamic> json) =>
      _$RankingUsersFromJson(json);

  Map<String, dynamic> toJson() => _$RankingUsersToJson(this);
}
