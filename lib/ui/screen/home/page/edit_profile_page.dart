import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/model/user.dart';
import 'package:travel_app/ui/component/button_widget.dart';
import 'package:travel_app/utils/user_preferences.dart';
import 'package:travel_app/ui/component/profile_widget.dart';
import 'package:travel_app/ui/component/textfield_widget.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({required this.updateInfo});
  @override
  _EditProfilePageState createState() => _EditProfilePageState();

  final VoidCallback updateInfo;
}

class _EditProfilePageState extends State<EditProfilePage> {
  User get user => UserPreferences.myUser;

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) => Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 108.0),
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 32),
              physics: BouncingScrollPhysics(),
              children: [
                ProfileWidget(
                  imagePath: user.imagePath,
                  isEdit: true,
                  onClicked: () async {},
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Повне ім`я',
                  text: user.name,
                  onChanged: (name) {
                    user.name = name;
                  },
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Email',
                  text: user.email,
                  onChanged: (email) {
                    user.email = email;
                  },
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Інформація',
                  text: user.about,
                  maxLines: 5,
                  onChanged: (about) {
                    user.about = about;
                  },
                ),
                const SizedBox(height: 24),
                ButtonWidget(
                  onClicked: () {
                    widget.updateInfo;
                    Navigator.of(context).pop();
                  },
                  text: 'Зберегти',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
