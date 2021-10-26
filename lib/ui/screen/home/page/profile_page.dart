import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/model/user.dart';
import 'package:travel_app/ui/screen/home/components/sertificatus.dart';
import 'package:travel_app/ui/screen/home/page/edit_profile_page.dart';
import 'package:travel_app/utils/user_preferences.dart';
import 'package:travel_app/ui/component/button_widget.dart';
import 'package:travel_app/ui/component/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        const SizedBox(height: 24),
        ProfileWidget(
          imagePath: user.imagePath,
          onClicked: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => EditProfilePage()),
            );
          },
        ),
        const SizedBox(height: 24),
        buildName(user),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonWidget(
              onClicked: () {
                showGeneralDialog(
                  barrierDismissible: true,
                  barrierLabel: '',
                  barrierColor: Colors.black38,
                  transitionDuration: Duration(milliseconds: 500),
                  pageBuilder: (ctx, anim1, anim2) => AlertDialog(
                    // title: Text('blured background'),
                    content: Certificate(),
                    // Text('background should be blured and little bit darker '),
                    elevation: 2,
                  ),
                  transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4 * anim1.value, sigmaY: 4 * anim1.value),
                    child: FadeTransition(
                      child: child,
                      opacity: anim1,
                    ),
                  ),
                  context: context,
                );
                // Navigator.of(context).pushNamed(COVID);
              },
              text: 'COVID SERTUFICAT',
            ),
          ],
        ),
        const SizedBox(height: 24),
        // NumbersWidget(),
        const SizedBox(height: 48),
        buildAbout(user),
      ],
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
