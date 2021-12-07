import 'package:flutter/material.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/model/Trip.dart';

class TripsPage extends StatelessWidget {
  List<Trip> trips = [
    Trip(
      destination: 'Тернопіль',
      dates: '04/09/21 - 09/09/21',
      image:
          'https://www.reuters.com/resizer/6oBo1-WFUspybc7LmXhGobSNG-k=/960x0/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/CSDXZLV6FNL3VI5BOYNVR5CLWY.jpg',
    ),
    Trip(
      destination: 'Лондон',
      dates: '01/07/21 - 09/08/21',
      image:
          'https://www.visitbritain.com/sites/default/files/styles/wysiwyg_image/public/consumer/vb34156199_1100.jpg?itok=8azk9zgC',
    ),
    Trip(
      destination: 'Лос-Анджелес',
      dates: '01/07/22 - 09/07/22',
      image: 'https://fimgs.net/himg/o.83164.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 38,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(MEW);
        },
      ),
      body: ListView.builder(
        itemCount: trips.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
            child: ListTile(
              onTap: () {
                // Navigator.of(context).pushNamed(TRIP);
              },
              isThreeLine: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              tileColor: Colors.teal.shade50,
              leading: Container(
                height: 100,
                child: Image(
                  image: NetworkImage(trips[index].image),
                ),
              ),
              title: Text(
                trips[index].destination,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                trips[index].dates,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
              trailing: Icon(
                Icons.edit,
                color: Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }
}
