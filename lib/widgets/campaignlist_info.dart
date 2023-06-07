import 'package:flutter/material.dart';
import 'package:gift2grow/models/campaign_item.dart';
import 'package:gift2grow/widgets/theme_button.dart';
import 'package:intl/intl.dart';

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
    if (widget.campaign.isCompleted == true) {
      return Container();
    } else {
      return Column(children: [
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Date: ${DateFormat.yMd().format(widget.campaign.createdAt)}",
            ),
            CustomButton(
              color: "primary",
              text: "Donate",
              onTap: () {
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
              paddingHorizontal: const EdgeInsets.symmetric(horizontal: 20),
            )
          ],
        )
      ]);
    }
  }
}
