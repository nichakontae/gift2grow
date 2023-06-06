import 'package:gift2grow/models/all_campaigns.dart';
import 'package:gift2grow/widgets/campaign.dart';
import 'package:json_annotation/json_annotation.dart';

part 'filter.g.dart';

@JsonSerializable()
class Filter {
  @JsonKey(name: "search")
  String search;

  @JsonKey(name: "tag")
  String tag;

  Filter({
    required this.search,
    required this.tag,
  });

  factory Filter.fromJson(Map<String, dynamic> json) =>
      _$FilterFromJson(json);

  Map<String, dynamic> toJson() => _$FilterToJson(this);
}