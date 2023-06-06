class DonateHistoryDetail {
  int campaignId;
  String trackingNumber;
  String donatedAt;
  String schoolName;
  bool isCompleted;

  DonateHistoryDetail(
      {required this.campaignId,
      required this.trackingNumber,
      required this.donatedAt,
      required this.schoolName,
      required this.isCompleted});
}
