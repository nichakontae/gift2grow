import 'package:flutter/material.dart';
import 'package:gift2grow/models/campaign_item.dart';
import 'package:gift2grow/widgets/theme_button.dart';

import '../screen/campaign_donate_page.dart';

class CampaignListInfo extends StatefulWidget {
  const CampaignListInfo({super.key, required this.campaign});
  final CampaignItem campaign;
  @override
  State<CampaignListInfo> createState() => _CampaignListInfoState();
}

class _CampaignListInfoState extends State<CampaignListInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.campaign.isCompleted == true
              ? Text(
                  "Complete Date: ${widget.campaign.completedDate.toString().substring(0, 10)}")
              : Text(
                  "Date: ${widget.campaign.createdAt.toString().substring(0, 10)}",
                ),
          CustomButton(
            color: "primary",
            text: "Donate",
            onTap: widget.campaign.isCompleted == true
                ? null
                : () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CampaignDonatePage(
                                  campaignId: widget.campaign.campaignId,
                                  topic: widget.campaign.topic,
                                  schoolName: widget.campaign.schoolName,
                                  location: widget.campaign.location,
                                  coverImage: widget.campaign.coverImg,
                                )));
                  },
            paddingHorizontal: const EdgeInsets.symmetric(horizontal: 15),
          )
        ],
      )
    ]);
  }
}
