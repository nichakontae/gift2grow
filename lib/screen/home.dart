// import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gift2grow/models/search_preload.dart';
// import 'package:gift2grow/models/all_campaigns.dart';
import 'package:gift2grow/models/user_info.dart';
import 'package:gift2grow/widgets/campaign_list.dart';
import 'package:gift2grow/widgets/my_searchbar.dart';
import 'package:gift2grow/widgets/theme_button.dart';
import 'package:gift2grow/widgets/topleft.dart';
import '../models/filter.dart';
import '../utilities/caller.dart';
// import 'package:gift2grow/widgets/navbar.dart';

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
  
  // Future<MyUserInfo> loading() async{
  //    User? user = FirebaseAuth.instance.currentUser;

  //    if (condition) {

  //    }
  //   return
  // }

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
    // _performSearch(campaigns);
  }

  @override
  Widget build(BuildContext context) {
    //  List<CampaignItem> filteredData = _performSearch(campaigns);
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
                          backgroundImage: NetworkImage(
                            'http://server1.ivelse.com:8080${userInfo!.profileImage}',
                          ),
                          radius: 25,
                        )
                      : const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/profileNull.png'),
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
                        color: filter.tag == "All" ?  "primary" : "secondary",
                        text: "All",
                        onTap: () {
                          setState(() {
                            filter.tag = "All";
                          });
                        },
                        paddingHorizontal:
                            const EdgeInsets.symmetric(horizontal: 20)),
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
                        paddingHorizontal:
                            const EdgeInsets.symmetric(horizontal: 20)),
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
                        paddingHorizontal:
                            const EdgeInsets.symmetric(horizontal: 20)),
                  ],
                ),
              ),

              CampaignList(status: filter.tag, search: filter.search,)
              

              // Builder(
              //   builder: (BuildContext context) {
              //      List<CampaignItem> filteredData = _performSearch();
              //      if (loading) {
              //        return 
              //        const Center(
              //       child: CircularProgressIndicator(color: Color(0xFFDC6E46)),
              //     );
              //      }
              //      else{
              //         return
              //           Expanded(
              //             child: GridView.count(
              //               padding: const EdgeInsets.only(top: 0, bottom: 20),
              //               crossAxisSpacing: 0,
              //               childAspectRatio: 8.2 / 10,
              //               crossAxisCount: 1,
              //               mainAxisSpacing: 40,
              //               children:
              //                   List.generate(filteredData.length, (index) {
              //                 return GestureDetector(
              //                   onTap: () {
              //                     Navigator.push(
              //                         context,
              //                         MaterialPageRoute(
              //                             builder: (context) => (Campaign(
              //                                   campaign: filteredData[index],
              //                                   // dormItem: filteredData[index],
              //                                   // previousPath: "home",
              //                                 ))));
              //                   },
              //                   child: Campaign(
              //                     campaign: filteredData[index],
              //                   ),
              //                 );
              //               }),
              //             ),
              //           );
              //   }
              //   }
              // )

              // const SizedBox(
              //   height: 10,
              // ),
              // FutureBuilder(
              //   builder: _performSearch()

              // )
              // FutureBuilder(
              //   builder: _performSearch()

              // )
              // if(true)

              //  List<CampaignItem> filteredData = _performSearch(campaigns)
              // if(loading  ){
              //   return const Text('sdsdaef');
              // }
          
            ],
          ),
        ));
  }
}
