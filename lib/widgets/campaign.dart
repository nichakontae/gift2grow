import 'package:flutter/material.dart';
import 'package:gift2grow/models/campaign_item.dart';
import 'package:gift2grow/widgets/campaignlist_info.dart';
import 'package:gift2grow/widgets/progress_bar.dart';
class Campaign extends StatefulWidget {
  const Campaign({
    super.key,
    required this.campaign,
  });

  final CampaignItem campaign;

  @override
  State<Campaign> createState() => _CampaignState();
}

class _CampaignState extends State<Campaign> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero, // Set padding to zero
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(24.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 10.0,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24.0),
              child: FadeInImage(
                image: NetworkImage(widget.campaign.coverImg),
                fadeInDuration: const Duration(milliseconds: 1),
                placeholder:
                    const AssetImage('assets/images/default_image.png'),
                width: double.infinity,
                height: 230,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.school),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Text(
                          widget.campaign.schoolName,
                          overflow: TextOverflow.fade,
                          softWrap: true,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ProgressBar(
                      trackingNumber: widget.campaign.trackingAmount,
                      completedAmount: widget.campaign.completedAmount,
                      isCompleted: widget.campaign.isCompleted,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                   Text(
                    widget.campaign.isCompleted == true ? "Remaining: 0" :
                            "Remaining: ${widget.campaign.completedAmount - widget.campaign.trackingAmount}",
                          ),
                    CampaignListInfo(campaign: widget.campaign)
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
