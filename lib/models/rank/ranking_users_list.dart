import 'package:gift2grow/models/rank/ranking_users.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ranking_users_list.g.dart';

@JsonSerializable()
class RankingUsersList {
  @JsonKey(name: 'success')
  bool success;

  @JsonKey(name: 'data')
  List<RankingUsers> data;

  RankingUsersList({
    required this.success,
    required this.data,
  });

  factory RankingUsersList.fromJson(Map<String, dynamic> json) =>
      _$RankingUsersListFromJson(json);

  Map<String, dynamic> toJson() => _$RankingUsersListToJson(this);
}
