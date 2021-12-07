import 'dart:async';

import 'package:travel_app/model/Trip.dart';

class Trips {
  final StreamController<List<Trip>> _streamController =
      StreamController<List<Trip>>();

  Stream<List<Trip>> get tripList => _streamController.stream;
// List<Trip> trips = [
//   Trip(destination: 'Kyiv', dates: '04/09/21 - 09/09/21', image: 'https://www.reuters.com/resizer/6oBo1-WFUspybc7LmXhGobSNG-k=/960x0/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/CSDXZLV6FNL3VI5BOYNVR5CLWY.jpg'),
//   Trip(destination: 'London', dates: '01/07/21 - 09/08/21', image: 'https://www.visitbritain.com/sites/default/files/styles/wysiwyg_image/public/consumer/vb34156199_1100.jpg?itok=8azk9zgC')
// ];
//   List<Trip> trips = [
//     Trip(
//         destination: 'Тернопіль',
//         dates: '04/09/21 - 09/09/21',
//         image:
//             'https://www.reuters.com/resizer/6oBo1-WFUspybc7LmXhGobSNG-k=/960x0/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/CSDXZLV6FNL3VI5BOYNVR5CLWY.jpg'),
//     Trip(
//         destination: 'Лондон',
//         dates: '01/07/21 - 09/08/21',
//         image:
//             'https://www.visitbritain.com/sites/default/files/styles/wysiwyg_image/public/consumer/vb34156199_1100.jpg?itok=8azk9zgC')
//   ];

  void addTrip(Trip trip) {
    // trips.add(trip);
  }
}
