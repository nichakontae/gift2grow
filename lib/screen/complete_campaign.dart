import 'package:flutter/material.dart';
import 'package:gift2grow/models/completed_caminfo.dart';
import 'package:gift2grow/widgets/letter_thank.dart';

import '../utilities/caller.dart';
import '../widgets/description.dart';
import '../widgets/progress_bar.dart';
import 'full_screen_image.dart';

class CompletedCampaign extends StatefulWidget {
  const CompletedCampaign(
      {super.key, required this.campaignId, required this.trackingAmount});

  final int campaignId;
  final int trackingAmount;
  @override
  State<CompletedCampaign> createState() => _CompletedCampaignState();
}

class _CompletedCampaignState extends State<CompletedCampaign> {
  CompletedCampaignInfo? campaignInfo;

  Future<void> getCampaignDetail() async {
    try {
      final response = await Caller.dio.get(
        '/campaign/completedCampaign?campaignId=${widget.campaignId}',
      );

      CompletedCampaignInfo? camapaign =
          CompletedCampaignInfo.fromJson(response.data);

      setState(() {
        campaignInfo = camapaign;
      });
      // print(response.data);
    } catch (e) {
      debugPrint(e.toString());
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
          imageUrls: campaignInfo!.evidenceImg,
          currentIndex: currentIndex,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (campaignInfo == null) {
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
                            campaignInfo!.coverImg,
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
                  padding: const EdgeInsets.fromLTRB(8, 15, 8, 0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            ProgressBar(
                              trackingNumber: widget.trackingAmount,
                              completedAmount: campaignInfo!.completedAmount,
                              isCompleted: campaignInfo!.isCompleted,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(campaignInfo!.topic,
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
                                  campaignInfo!.schoolName,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.fade,
                                  softWrap: true,
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Color.fromARGB(255, 211, 186, 186)),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0, bottom: 10),
                          child: DescriptionTextWidget(
                            text: campaignInfo!.description,
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
                        'Evident',
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
                    itemCount: campaignInfo!.evidenceImg.length,
                    itemBuilder: (BuildContext context, int j) {
                      return GestureDetector(
                        onTap: () => _showFullScreenImage(j),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: FadeInImage(
                                fadeInDuration: const Duration(milliseconds: 1),
                                placeholder: const AssetImage(
                                    'assets/images/default_image.png'),
                                image: NetworkImage(
                                  campaignInfo!.evidenceImg[j],
                                ),
                                fit: BoxFit.cover,
                                width: 100,
                                height: 100,
                              )),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              LetterThank(letterOfThank: campaignInfo!.letterThank)
            ],
          ),
        ),
      ),
    );
  }
}
