import 'package:flutter/material.dart';

class ChooseTransport extends StatefulWidget {
  const ChooseTransport({Key? key, required this.locationTo}) : super(key: key);

  final String? locationTo;

  @override
  _ChooseTransportState createState() => _ChooseTransportState();
}

class _ChooseTransportState extends State<ChooseTransport> {
  final _controller = TextEditingController();

  final tickets = <Widget>[
    TransportOption(
        dateTimeFrom: DateTime.now(),
        dateTimeTo: DateTime.now(),
        locationFrom: 'Львів',
        locationTo: 'Варшава'),
    TransportOption(
        dateTimeFrom: DateTime.now(),
        dateTimeTo: DateTime.now(),
        locationFrom: 'Львів',
        locationTo: 'Варшава'),
    TransportOption(
        dateTimeFrom: DateTime.now(),
        dateTimeTo: DateTime.now(),
        locationFrom: 'Львів',
        locationTo: 'Варшава'),
    TransportOption(
        dateTimeFrom: DateTime.now(),
        dateTimeTo: DateTime.now(),
        locationFrom: 'Львів',
        locationTo: 'Варшава'),
    TransportOption(
        dateTimeFrom: DateTime.now(),
        dateTimeTo: DateTime.now(),
        locationFrom: 'Київ',
        locationTo: 'Варшава'),
    TransportOption(
        dateTimeFrom: DateTime.now(),
        dateTimeTo: DateTime.now(),
        locationFrom: 'Київ',
        locationTo: 'Варшава'),
    TransportOption(
        dateTimeFrom: DateTime.now(),
        dateTimeTo: DateTime.now(),
        locationFrom: 'Київ',
        locationTo: 'Варшава'),
    TransportOption(
        dateTimeFrom: DateTime.now(),
        dateTimeTo: DateTime.now(),
        locationFrom: 'Київ',
        locationTo: 'Варшава'),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tickets.length,
      itemBuilder: (BuildContext context, int index) {
        return tickets[index];
      },
    );
    //   Column(
    //   children: List.from(tickets),
    // );
  }
}

class TransportOption extends StatelessWidget {
  const TransportOption({
    required this.dateTimeFrom,
    required this.dateTimeTo,
    required this.locationFrom,
    required this.locationTo,
  });

  final DateTime dateTimeFrom;
  final DateTime dateTimeTo;
  final String locationFrom;
  final String locationTo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(color: Colors.grey[900]),
      height: 100,
      child: ListTile(
        leading: Icon(
          Icons.local_airport,
          color: Colors.purple,
        ),
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              locationFrom,
              style: TextStyle(color: Colors.yellow, fontSize: 15),
            ),
            Text(
              locationTo,
              style: TextStyle(color: Colors.green, fontSize: 15),
            ),
          ],
        ),
        title: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                '${dateTimeFrom.day}.${dateTimeFrom.month}.${dateTimeFrom.year}'),
            Text(
                '${dateTimeFrom.hour}:${dateTimeFrom.minute}-${dateTimeTo.hour}:${dateTimeTo.minute}'),
          ],
        )),
      ),
    );
  }
}
