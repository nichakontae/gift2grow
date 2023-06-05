// ignore_for_file: camel_case_types

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gift2grow/models/rank/user_profile_for_share.dart';
import 'package:gift2grow/widgets/rank_widget/share_template/first_rank.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
enum SocialMedia {facebook,twitter,instagramFeed, instagramStories}
class PreviewShare extends StatefulWidget {
  const PreviewShare({Key? key, required this.profile}) : super(key: key);
  final UserProfileForShare profile;

  @override
  State<PreviewShare> createState() => _PreviewShareState();
}

class _PreviewShareState extends State<PreviewShare> {
  final ScreenshotController controller = ScreenshotController();


  Future<String> saveImage(Uint8List bytes) async {
    await [Permission.storage].request();
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final name = 'screenshot_$time';
    final result = await ImageGallerySaver.saveImage(bytes, name: name);
    return result['filePath'];
  }

  Future saveAndShare(Uint8List bytes)async{
    final directory = await getApplicationDocumentsDirectory();
    final image = File('${directory.path}/ranking.png');
    image.writeAsBytesSync(bytes);

    await Share.shareFiles([image.path]);

  }

  Future share(SocialMedia socialPlatform) async{
    final urls = {
      SocialMedia.facebook: "https://www.facebook.com/sharer/sharer.php?"
    };
  }
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: Scaffold(
        body: Stack(
          children: [
            FirstRank(profile: widget.profile),
            Positioned(
              top: 70,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 103, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(); // Perform the back navigation
                  },
                  child: Image.asset(
                    'assets/icon/cancel.png',
                    scale: 14,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              right: 20,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      //color: Colors.black,
                      color: Colors.black.withOpacity(0.25), // Shadow color
                      blurRadius: 1, // Spread radius
                      offset: const Offset(1, 2), // Offset in x and y directions
                    ),
                  ],
                ),
                child: GestureDetector(
                  onTap: () async {
                    final image = await controller
                        .captureFromWidget(FirstRank(profile: widget.profile),pixelRatio: MediaQuery.of(context).devicePixelRatio);
                    if (image == null) return;
                    await saveImage(image);
                  },
                  child: Image.asset(
                    'assets/icon/download.png',
                    scale: 12,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 20,
              child: GestureDetector(
                onTap: ()async{
                    // share(SocialMedia.facebook);
                  final image = await controller
                      .captureFromWidget(FirstRank(profile: widget.profile),pixelRatio: MediaQuery.of(context).devicePixelRatio);
                  saveAndShare(image);
                },
                child: Image.asset(
                  'assets/icon/facebook.png',
                  scale: 12,
                ),
              ),
            ),
            Positioned(
              bottom: 14,
              left: 75,
              child: Image.asset(
                'assets/icon/twitter.png',
                scale: 11.9,
              ),
            ),
            Positioned(
              bottom: 13.5,
              left: 130,
              child: Image.asset(
                'assets/icon/instagram.png',
                scale: 11.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
