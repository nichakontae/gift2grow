import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gift2grow/screen/edit_profile_page.dart';
import 'package:gift2grow/widgets/profile_widgets/history_section.dart';
import 'package:gift2grow/widgets/profile_widgets/user_info_section.dart';
import 'package:gift2grow/widgets/theme_button.dart';

import '../../screen/donate_history.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 32, 0, 16),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://happeningandfriends.com/uploads/happening/products/46/004554/mock_ST_newSadCat.jpg'),
                radius: 90.0,
              ),
            ),
            Text(
              "User Name",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("Profile",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  GestureDetector(
                    child: const Icon(Icons.edit_square),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfilePage()),
                      );
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: const Text(
                        "Name : ",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff9468AC)),
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        "FirstName LastName",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: const Text(
                        "Email  : ",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff9468AC)),
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        "User.Email@gmail.com",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
                      ),
                    ),
                  ],
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("History",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "12" + " succesful donations",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff9468AC)),
                  ),
                ],
              ),
              for (var i = 0; i < 2; i++) const DonateHistory(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HistoryPage()),
                        );
                      },
                      child: const Text(
                        'show more...',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff9468AC)),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 32, 0, 16),
                child: CustomButton(
                    color: 'primary', text: 'LogOut', onTap: () {}),
              )
            ],
          ),
        ),
      ],
    );
  }
}
