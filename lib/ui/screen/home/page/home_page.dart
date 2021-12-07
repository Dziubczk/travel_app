import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/model/Trip.dart';
import 'package:travel_app/model/user.dart';
import 'package:travel_app/ui/screen/home/components/sertificatus.dart';
import 'package:travel_app/ui/screen/home/page/edit_profile_page.dart';
import 'package:travel_app/utils/user_preferences.dart';
import 'package:travel_app/ui/component/button_widget.dart';
import 'package:travel_app/ui/component/profile_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<HomePage> {
  List<Trip> trips = [
    Trip(
      destination: 'Афіни',
      dates: '04/09/21 - 09/09/21',
      image:
          'https://blog.reikartz.com/media/filer_public/91/10/911009ec-19a8-4926-942c-7edebd0ec5cc/athens_layover.jpg',
    ),
    Trip(
      destination: 'Київ',
      dates: '01/07/21 - 09/08/21',
      image: 'https://miro.medium.com/max/14272/1*ib92bb0GBwDJ_6p_k81STA.jpeg',
    ),
    Trip(
      destination: 'Стамбул',
      dates: '01/07/22 - 09/07/22',
      image: 'http://www.atorus.ru/public/ator/data/4544e6.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      body: Column(
        children: [
          Text(
            'Актуальні пропозиції',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          ListView.builder(
            itemCount: trips.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                child: Container(
                  // shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(15.0)),
                  color: Colors.teal.shade50,
                  child: Stack(
                    children: [
                      Container(
                        height: 175,
                        width: double.infinity,
                        child: Image(
                          image: NetworkImage(trips[index].image),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          trips[index].destination,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 3.0,
                                color: Colors.black,
                              ),
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 8.0,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
