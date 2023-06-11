import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gift2grow/models/search_preload.dart';
import 'package:gift2grow/models/user_info.dart';
import 'package:gift2grow/widgets/campaign_list.dart';
import 'package:gift2grow/widgets/my_searchbar.dart';
import 'package:gift2grow/widgets/theme_button.dart';
import 'package:gift2grow/widgets/topleft.dart';
import '../models/filter.dart';
import '../utilities/caller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Filter filter = Filter(
    search: '',
    tag: 'All',
  );
  String search = '';
  User? user = FirebaseAuth.instance.currentUser;
  MyUserInfo? userInfo;

  void getUserInfo(String uid) async {
    try {
      final response = await Caller.dio.get('/profile/getProfile?userId=$uid');
      setState(() {
        userInfo = MyUserInfo(
          userId: response.data["id"],
          userName: response.data["username"],
          profileImage: response.data["profile_image"],
          firstName: response.data["first_name"],
          lastName: response.data['last_name'],
          email: response.data['email'],
        );
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void refreshState() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    SearchPreload.homeReload = refreshState;
    getUserInfo(user!.uid);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 35.0, right: 35, top: 55),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Theme.of(context).colorScheme.primary, Colors.white])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  userInfo?.profileImage != null
                      ? CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(
                            'http://server1.ivelse.com:8080${userInfo!.profileImage}',
                          ),
                          radius: 25,
                        )
                      : const CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage('assets/images/profileNull.png'),
                          radius: 25,
                        ),
                  const MyTopLeft()
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              MySearchBar(filter: filter),
              const SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomButton(
                        color: filter.tag == "All" ? "primary" : "secondary",
                        text: "All",
                        onTap: () {
                          setState(() {
                            filter.tag = "All";
                          });
                        },
                        paddingHorizontal: const EdgeInsets.symmetric(horizontal: 20)),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomButton(
                        color: filter.tag == "Ongoing" ? "primary" : "secondary",
                        text: "Ongoing",
                        onTap: () {
                          setState(() {
                            filter.tag = "Ongoing";
                          });
                        },
                        paddingHorizontal: const EdgeInsets.symmetric(horizontal: 20)),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomButton(
                        color: filter.tag == "Complete" ? "primary" : "secondary",
                        text: "Complete",
                        onTap: () {
                          setState(() {
                            filter.tag = "Complete";
                          });
                        },
                        paddingHorizontal: const EdgeInsets.symmetric(horizontal: 20)),
                  ],
                ),
              ),
              CampaignList(
                status: filter.tag,
                search: filter.search,
              )
            ],
          ),
        ));
  }
}
