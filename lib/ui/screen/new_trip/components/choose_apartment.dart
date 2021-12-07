import 'package:flutter/material.dart';

class ChooseApartment extends StatefulWidget {
  const ChooseApartment({Key? key}) : super(key: key);

  @override
  _ChooseApartmentState createState() => _ChooseApartmentState();
}

class _ChooseApartmentState extends State<ChooseApartment> {
  final _controller = TextEditingController();

  final houses = <Widget>[
    ApartmentOption(
        location: 'Апартаменти в центрі',
        imageLink:
            "https://kiyavia.com/files/cities/barselona/Barcelona_1920.jpg"),
    ApartmentOption(
        location: 'Апартаменти біля моря',
        imageLink:
            "https://i2.wp.com/guruturizma.ru/wp-content/uploads/2016/04/Barcelona-beach.jpg?fit=1280%2C853&ssl=1"),
    ApartmentOption(
        location: 'Апартаменти на пляжі',
        imageLink:
            "https://www.barcelonacheckin.com/img/stored_images/barcelona/articles/top-10-barcelona-beach-apartments.jpg"),
    ApartmentOption(
        location: 'Апартаменти на окраїні',
        imageLink:
            "https://suitelife.com/wp-content/uploads/2017/06/gracia-barcelona-6-933x700-660x495.jpg"),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: houses.length,
      itemBuilder: (BuildContext context, int index) {
        return houses[index];
      },
    );
    //   Column(
    //   children: List.from(tickets),
    // );
  }
}

class ApartmentOption extends StatelessWidget {
  const ApartmentOption({
    // required this.dateTimeFrom,
    // required this.dateTimeTo,
    // required this.locationFrom,
    required this.location,
    required this.imageLink,
  });

  // final DateTime dateTimeFrom;
  // final DateTime dateTimeTo;
  final String location;
  final String imageLink;

  // final String locationTo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        image: DecorationImage(
          image: NetworkImage(
            "https://kiyavia.com/files/cities/barselona/Barcelona_1920.jpg",
          ),
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.43),
            BlendMode.dstATop,
          ),
          fit: BoxFit.cover,
        ),
      ),
      height: 200,
      child: ListTile(
        leading: Icon(
          Icons.house,
          color: Colors.purple,
        ),
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          children: [],
        ),
        title: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(location),
          ],
        )),
      ),
    );
  }
}
