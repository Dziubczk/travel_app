import 'package:flutter/material.dart';

class ChooseTransport extends StatefulWidget {
  const ChooseTransport({Key? key, required this.tickets, required this.title})
      : super(key: key);

  final List<Widget> tickets;
  final String title;

  @override
  _ChooseTransportState createState() => _ChooseTransportState();
}

class _ChooseTransportState extends State<ChooseTransport> {
  List<Widget> get tickets => widget.tickets;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.title),
        ListView.builder(
          shrinkWrap: true,
          itemCount: tickets.length,
          itemBuilder: (BuildContext context, int index) {
            return tickets[index];
          },
        ),
      ],
    );
    //   Column(
    //   children: List.from(tickets),
    // );
  }
}

class TransportOption extends StatelessWidget {
  TransportOption({
    required this.dateTimeFrom,
    required this.dateTimeTo,
    required this.locationFrom,
    required this.locationTo,
  });

  final DateTime dateTimeFrom;
  final DateTime dateTimeTo;
  final String locationFrom;
  final String locationTo;
  final ValueNotifier<bool> isSelected = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isSelected,
      builder: (context, bool value, _) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            color: value ? Colors.grey[700] : Colors.grey[850],
          ),
          height: 100,
          child: ListTile(
            onTap: () {
              isSelected.value = !value;
            },
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
                      '${_withZeros(dateTimeFrom.hour)}:${_withZeros(dateTimeFrom.minute)}-${_withZeros(dateTimeTo.hour)}:${_withZeros(dateTimeTo.minute)}'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

String _withZeros(int value) => value > 9 ? '$value' : '0$value';
