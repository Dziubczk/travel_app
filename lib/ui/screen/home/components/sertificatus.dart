import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/model/user.dart';
import 'package:travel_app/utils/user_preferences.dart';
import 'package:travel_app/ui/component/build_image.dart';

class Certificate extends StatelessWidget {
  Certificate({Key? key}) : super(key: key);
  User get user => UserPreferences.myUser;

  ValueNotifier<bool> qr = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: 280,
      child: ValueListenableBuilder(
          valueListenable: qr,
          builder: (context, bool qrqrqr, _) {
            if (qrqrqr) return Image.asset('assets/qr.jpg');
            return Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Внутрішній COVID-19 сертифікат'),
                SizedBox(
                  height: 200,
                  child: Row(
                    children: [
                      buildImage(
                        imagePath: user.imagePath,
                        onClicked: () {
                          qr.value = true;
                        },
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        width: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'дата народження: 10.02.1999',
                              softWrap: true,
                            ),
                            Text(
                              'дійсний до: 31.01.2022',
                              softWrap: true,
                            ),
                            Text(
                              '# сертифікату: 123456',
                              softWrap: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Text('Луценко О.В.'),
              ],
            );
          }),
    );
  }
}
