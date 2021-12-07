import 'package:flutter/material.dart';

class ChooseApartment extends StatefulWidget {
  const ChooseApartment({Key? key}) : super(key: key);

  @override
  _ChooseApartmentState createState() => _ChooseApartmentState();
}

class _ChooseApartmentState extends State<ChooseApartment> {
  final _controller = TextEditingController();

  final houses = <Widget>[
    ApartmentOption(location: 'Lviv'),
    ApartmentOption(location: 'Lviv'),
    ApartmentOption(location: 'Lviv'),
    ApartmentOption(location: 'Lviv'),
    ApartmentOption(location: 'Lviv'),
    ApartmentOption(location: 'Lviv'),
    ApartmentOption(location: 'Lviv'),
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
  });

  // final DateTime dateTimeFrom;
  // final DateTime dateTimeTo;
  final String location;

  // final String locationTo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        image: DecorationImage(
          image: NetworkImage(
            "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c4/%D0%9B%D0%B2%D0%BE%D0%B2_%D0%93%D0%B0%D0%BB%D0%B8%D1%86%D0%B8%D1%98%D0%B0.jpg/300px-%D0%9B%D0%B2%D0%BE%D0%B2_%D0%93%D0%B0%D0%BB%D0%B8%D1%86%D0%B8%D1%98%D0%B0.jpg",
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
