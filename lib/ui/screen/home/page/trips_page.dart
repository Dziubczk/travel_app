import 'package:flutter/material.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/model/Trip.dart';
import 'package:travel_app/ui/screen/trip/trip_screen.dart';

class TripsPage extends StatefulWidget {
  @override
  State<TripsPage> createState() => _TripsPageState();
}

class _TripsPageState extends State<TripsPage> {
  List<Trip> trips = [
    Trip(
      name: 'Подорож у Тернопіль',
      destination: 'Тернопіль',
      dates: '04/09/2021 - 09/09/2021',
      tickets: 'da',
      apartments: 'Апартаменти',
      image:
          'https://www.reuters.com/resizer/6oBo1-WFUspybc7LmXhGobSNG-k=/960x0/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/CSDXZLV6FNL3VI5BOYNVR5CLWY.jpg',
    ),
    Trip(
      name: 'Подорож у Великобританію',
      destination: 'Лондон',
      dates: '01/07/2021 - 09/08/2021',
      tickets: 'da',
      apartments: 'Апартаменти',
      image:
          'https://www.visitbritain.com/sites/default/files/styles/wysiwyg_image/public/consumer/vb34156199_1100.jpg?itok=8azk9zgC',
    ),
    Trip(
      name: 'Подорож до США',
      destination: 'Лос-Анджелес',
      dates: '01/07/2022 - 09/07/2022',
      tickets: 'da',
      apartments: 'Апартаменти',
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
        onPressed: () async {
          final newTrip = await Navigator.of(context).pushNamed(MEW);

          if (newTrip != null && newTrip is Trip) {
            setState(() {
              trips.add(newTrip);
            });
          }
        },
      ),
      body: ListView.builder(
        itemCount: trips.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
            child: ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TripScreen(trip: trips[index]),
                  ),
                  // (BuildContext context) =>TripScreen(trip: trips[index])
                );
              },
              isThreeLine: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              tileColor: Colors.teal.shade100,
              leading: Image(
                image: NetworkImage(trips[index].image),
                fit: BoxFit.fill,
                height: 100,
                width: 100,
              ),
              title: Text(
                trips[index].name,
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
