// import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gift2grow/models/campaign_detail.dart';
import 'package:gift2grow/screen/campaign_donate_page.dart';
import 'package:gift2grow/utilities/caller.dart';
import 'package:gift2grow/widgets/progress_bar.dart';
import 'package:gift2grow/widgets/theme_button.dart';
import 'package:gift2grow/widgets/unordered_list.dart';

import '../widgets/description.dart';
import 'full_screen_image.dart';

class CampaignDetailPage extends StatefulWidget {
  final int campaignId;
  final int amountTracking;
  const CampaignDetailPage(
      {super.key, required this.campaignId, required this.amountTracking});

  @override
  State<CampaignDetailPage> createState() => _CampaignDetailPageState();
}

class _CampaignDetailPageState extends State<CampaignDetailPage> {
  CampaignDetail? campaign;
  late int remaining = campaign!.completedAmount - widget.amountTracking;
// /campaign/getCampaignDetail?campaignId=
  Future<void> getCampaignDetail() async {
    try {
      final response = await Caller.dio.get(
        '/campaign/getCampaignDetail?campaignId=${widget.campaignId}',
      );
      // print(response.data);
      setState(() {
        campaign = CampaignDetail(
          campaignId: response.data["campaignId"],
          coverImage: response.data["cover_image"],
          topic: response.data["topic"],
          location: response.data["location"],
          schoolName: response.data["school_name"],
          description: response.data["description"],
          isComplete: response.data["is_completed"],
          telContact: response.data["tel_contact"],
          completedAmount: response.data["completed_amount"],
          createdAt: response.data["created_at"],
          wantLists: List<String>.from(response.data["want_lists"]),
          campaignImages: List<String>.from(response.data["campaign_images"]),
        );
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
        print('error ja');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getCampaignDetail();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _showFullScreenImage(int currentIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenImageScreen(
          imageUrls: campaign!.campaignImages,
          currentIndex: currentIndex,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (campaign == null) {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [CircularProgressIndicator()],
      );
    }
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              SizedBox(
                height: 350,
                width: 350,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: SizedBox(
                            child: FadeInImage(
                          placeholder: const AssetImage(
                              "assets/images/default_image.png"),
                          image: NetworkImage(
                            campaign!.coverImage,
                          ),
                          fit: BoxFit.cover,
                          fadeInDuration: const Duration(milliseconds: 1),
                        )),
                      ),
                    ),
                    Positioned(
                      top: 20.0,
                      left: 20.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(122, 150, 150, 150),
                          borderRadius: BorderRadius.circular(21.0),
                        ),
                        child: IconButton(
                          color: Colors.white,
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(8, 15, 8, 0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            ProgressBar(
                              trackingNumber: widget.amountTracking,
                              completedAmount: campaign!.completedAmount,
                              isCompleted: campaign!.isComplete,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Remaining:$remaining',
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 12),
                                ),
                                Text(
                                  'Date:${campaign!.createdAt}',
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 12),
                                )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(campaign!.topic,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(148, 104, 172, 1),
                            )),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 8),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.school,
                                size: 25,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                  campaign!.schoolName,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.fade,
                                  softWrap: true,
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0, bottom: 10),
                          child: DescriptionTextWidget(
                            text: campaign!.description,
                          ),
                        ),
                      ])),
              const Padding(
                padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.start,
                        'Gallery',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            // childAspectRatio: 3 / 2,
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0),
                    scrollDirection: Axis.horizontal,
                    itemCount: campaign!.campaignImages.length,
                    itemBuilder: (BuildContext context, int j) {
                      return GestureDetector(
                        onTap: () => _showFullScreenImage(j),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: FadeInImage(
                              image: NetworkImage(campaign!.campaignImages[j]),
                              fadeInDuration: const Duration(milliseconds: 1),
                              placeholder: const AssetImage(
                                  'assets/images/default_image.png'),
                              width: double.infinity,
                              height: 230,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Wanted Lists',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 0, 16),
                    child: UnorderedList(campaign!.wantLists),
                  ),
                ],
              ),
              const Divider(
                thickness: 3,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 32),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const SizedBox(width: 10.0),
                    const Icon(
                      Icons.phone,
                      size: 30,
                    ),
                    const SizedBox(width: 15.0),
                    Text(
                      'Tel. ${campaign!.telContact}',
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
              ),
              CustomButton(
                  color: "primary",
                  text: "Donate now",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CampaignDonatePage(
                                  campaignId: campaign!.campaignId,
                                  topic: campaign!.topic,
                                  schoolName: campaign!.schoolName,
                                  location: campaign!.location,
                                  coverImage: campaign!.coverImage,
                                )));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
