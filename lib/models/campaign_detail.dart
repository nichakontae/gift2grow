class CampaignDetail {
  int campaignId;
  String coverImage;
  String topic;
  String location;
  String schoolName;
  String description;
  bool isComplete;
  String telContact;
  int completedAmount;
  String createdAt;
  List<String> wantLists;
  List<String> campaignImages;


  CampaignDetail(
    {
      required this.campaignId,
      required this.coverImage,
      required this.topic,
      required this.location,
      required this.schoolName,
      required this.description,
      required this.isComplete,
      required this.telContact,
      required this.completedAmount,
      required this.createdAt,
      required this.wantLists,
      required this.campaignImages,

    }
  );
}

// import 'package:image_picker/image_picker.dart';
// import 'package:json_annotation/json_annotation.dart';

// part 'campaign_detail.g.dart';

// @JsonSerializable()
// class CampaignDetail {
//   @JsonKey(name: 'campaignId')
//   int campaignId;

//   @JsonKey(name: 'cover_image')
//   String coverImage;

//   @JsonKey(name: 'topic')
//   String topic;

//   @JsonKey(name: 'location')
//   String location;

//   @JsonKey(name: 'school_name')
//   String schoolName;

//   @JsonKey(name: 'description')
//   String description;

//   @JsonKey(name: 'is_complete')
//   bool isComplete;

//   @JsonKey(name: 'tel_contact')
//   String telContact;

//   @JsonKey(name: 'completed_amount')
//   int completedAmount;

//   @JsonKey(name: 'created_at')
//   DateTime createdAt;

//   // @JsonKey(includeFromJson: false)
//   // XFile? coverImage;

//   @JsonKey(name: 'want_lists')
//   List<String> wantLists;

//   @JsonKey(name: 'campaign_images')
//   List<String> campaignImages;



//   CampaignDetail({
//     required this.campaignId,
//     required this.coverImage,
//     required this.topic,
//     required this.location,
//     required this.schoolName,
//     required this.description,
//     required this.isComplete,
//     required this.telContact,
//     required this.completedAmount,
//     required this.createdAt,
//     required this.wantLists,
//     required this.campaignImages,
   
//   });

//   factory CampaignDetail.fromJson(Map<String, dynamic> json) => _$CampaignDetailFromJson(json);

//   Map<String, dynamic> toJson() => _$CampaignDetailToJson(this);
// }
