import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gift2grow/models/campaign_donate.dart';
import 'package:gift2grow/widgets/add_tracking.dart';


class CampaignDonatePage extends StatefulWidget {
  final int campaignId;
  final String topic;
  final String schoolName;
  final String location;
  final String coverImage;

  const CampaignDonatePage(
      {super.key,
      required this.campaignId,
      required this.topic,
      required this.schoolName,
      required this.location,
      required this.coverImage});

  @override
  State<CampaignDonatePage> createState() => _CampaignDonatePageState();
}

class _CampaignDonatePageState extends State<CampaignDonatePage> {
  CampaignDonate? campaign;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    //  myController.addListener(_printLatestValue);
    final User? user = auth.currentUser;
    final uid = user!.uid;
    setState(() {
      campaign = CampaignDonate(
        campaignId: widget.campaignId,
        coverImage: widget.coverImage,
        topic: widget.topic,
        location: widget.location,
        schoolName: widget.schoolName,
        userId: uid,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              SizedBox(
                height: 200,
                width: 350,
                child: Stack(
                  children: [
                    Card(
                      color: Colors.deepPurpleAccent[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 8,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: SizedBox(
                          child: Image.network(
                            campaign!.coverImage,
                            fit: BoxFit.cover,
                          ),
                        ),
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
                  padding: const EdgeInsets.fromLTRB(8, 24, 8, 0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                              Text(
                                campaign!.schoolName,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ])),
              const Padding(
                padding: EdgeInsets.fromLTRB(8, 10, 8, 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.start,
                        'Address',
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
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 26),
                child: Text(
                  campaign!.location,
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.start,
                        'Tracking number',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 26),
                child: Text(
                  "If you have sent the items you want to donate, please enter the tracking number to keep as evidence of your donation.",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
              AddTracking(
                  campaignId: campaign!.campaignId, userId: campaign!.userId)
            ],
          ),
        ),
      ),
    );
  }
}
