import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/utils/user_preferences.dart';
import 'package:travel_app/widget/build_image.dart';

class Certificate extends StatelessWidget {
  const Certificate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Внутрішній COVID-19 sertificatus'),
          SizedBox(
            height: 200,
            child: Row(
              children: [
                buildImage(imagePath: user.imagePath, onClicked: () {}),
                SizedBox(width: 15),
                SizedBox(
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('data narodgennya', softWrap: true,),
                      Text('diysnuy do', softWrap: true,),
                      Text('# sertuficatu', softWrap: true,),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Text('PIB'),
        ],
      ),
    );
  }
}
