import 'package:gift2grow/models/notification/noti_object.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_noti.g.dart';

@JsonSerializable()
class UserNoti {
  @JsonKey(name: 'noti_object_id')
  int notiObjectId;

  @JsonKey(name: 'noti_object')
  NotiObject notiObject;

  @JsonKey(name: 'user_id')
  String userId;

  // @JsonKey(name: 'user')
  // String? user;

  @JsonKey(name: 'is_read')
  bool isRead;

  UserNoti(
      {required this.notiObjectId,
      required this.notiObject,
      required this.userId,
      // this.user,
      required this.isRead});

  factory UserNoti.fromJson(Map<String, dynamic> json) =>
      _$UserNotiFromJson(json);
  Map<String, dynamic> toJson() => _$UserNotiToJson(this);
}
