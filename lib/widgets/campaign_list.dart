import 'package:flutter/material.dart';
import 'package:gift2grow/screen/campaign_detail_page.dart';
import 'package:gift2grow/screen/complete_campaign.dart';
import 'package:gift2grow/widgets/campaign.dart';

import '../models/campaign_item.dart';
import '../utilities/caller.dart';

class CampaignList extends StatefulWidget {
  const CampaignList({super.key, required this.status, required this.search});

  final String status;
  final String search;
  @override
  State<CampaignList> createState() => _CampaignListState();
}

class _CampaignListState extends State<CampaignList> {
  bool loading = false;
  List<CampaignItem> filterResult = [];
  List<CampaignItem> campaigns = [];
  // final ScrollController _scrollController = ScrollController();

  void getAllCampaigns() async {
    setState(() {
      loading = true;
    });
    try {
      final response = await Caller.dio.get('/home/getAllCampaign');
      List<CampaignItem> all = response.data
          .map<CampaignItem>((json) => CampaignItem.fromJson(json))
          .toList();
      setState(() {
        campaigns = all;
      });
      // print(campaigns[0].campaignId);
      setState(() {
        loading = false;
      });
      // print(campaigns[0].completedAmount);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  List<CampaignItem> _performSearch(List<CampaignItem> campaignList) {
    setState(() {
      loading = true;
    });
    //  setState(() {
    //     _scrollController.jumpTo(0); // Scroll to the top
    //   });
    List<CampaignItem> filteredData = campaignList
        .where((element) => element.schoolName
            .toLowerCase()
            .contains(widget.search.toLowerCase()))
        .toList();

    if (widget.status == "Ongoing") {
      filteredData = filteredData
          .where((element) => element.isCompleted == false)
          .toList();
      setState(() {
        loading = false;
      });
      return filteredData;
    } else if (widget.status == "Complete") {
      filteredData =
          filteredData.where((element) => element.isCompleted == true).toList();
      setState(() {
        loading = false;
      });
      return filteredData;
    }
    setState(() {
      loading = false;
    });
    // print(campaignList);
    return filteredData;
  }
  //  void _scrollListener() {
  //   if (_scrollController.offset <= 0) {
  //     // Scroll position is at or near the top
  //     setState(() {
  //       _scrollController.jumpTo(0); // Scroll to the top
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();
    getAllCampaigns();
    //  _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    //  _scrollController.removeListener(_scrollListener);
    // _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      // filterResult = _performSearch(campaigns);
      // _performSearch(campaigns);
      return const Center(
        child: CircularProgressIndicator(color: Color(0xFFDC6E46)),
      );
    } else {
      // print(filterResult);
      filterResult = _performSearch(campaigns);
      return Builder(builder: (BuildContext context) {
        return Expanded(
          child: GridView.count(
            // controller: _scrollController,
            padding: const EdgeInsets.only(top: 0, bottom: 20),
            crossAxisSpacing: 0,
            childAspectRatio: 8.2 / 10,
            crossAxisCount: 1,
            mainAxisSpacing: 40,

            children: List.generate(filterResult.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (filterResult[index]
                                      .isCompleted ==
                                  true
                              ? CompletedCampaign(
                                  campaignId: filterResult[index].campaignId,
                                  trackingAmount:
                                      filterResult[index].trackingAmount)
                              : CampaignDetailPage(
                                  campaignId: filterResult[index].campaignId,
                                  amountTracking:
                                      filterResult[index].trackingAmount,
                                  // dormItem: filteredData[index],
                                  // previousPath: "home",
                                ))));
                },
                child: Campaign(
                  campaign: filterResult[index],
                ),
              );
            }),
          ),
        );
      });
    }
  }
}
