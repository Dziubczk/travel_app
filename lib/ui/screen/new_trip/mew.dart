import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:travel_app/constants.dart';
import 'package:travel_app/model/Trip.dart';
import 'package:travel_app/ui/screen/new_trip/components/choose_apartment.dart';
import 'package:travel_app/ui/screen/new_trip/components/choose_transport.dart';
import 'package:travel_app/ui/screen/new_trip/components/city_search.dart';
import 'package:travel_app/ui/component/appbar_widget.dart';

class Mew extends StatefulWidget {
  @override
  _MewState createState() => _MewState();
}

class _MewState extends State<Mew> {
  final myController = TextEditingController();
  final searchController = TextEditingController();

  late String tripName;
  String? tripLocation;
  late String tripDate;
  late String tripTicket = '14/12/2021 - 21/12/2021';
  late String tripAppartament = 'Апартаменти біля моря';

  final tickets = <Widget>[];
  final backTickets = <Widget>[];

  int _selectedIndex = 0;
  late List<Widget> _pages;

  bool get _isNextAvailable => _selectedIndex < _pages.length - 1;

  bool get _isPrevAvailable => _selectedIndex > 0;

  void _moveNext() {
    if (_pages.length < 3 && tripLocation != null) {
      tickets.addAll(
        <Widget>[
          TransportOption(
            dateTimeFrom:
                DateTime.now().add(Duration(days: 6, hours: 8, minutes: 11)),
            dateTimeTo:
                DateTime.now().add(Duration(days: 6, hours: 12, minutes: 15)),
            locationFrom: 'Львів',
            locationTo: tripLocation.getSafeString('Варшава'),
          ),
          TransportOption(
            dateTimeFrom:
                DateTime.now().add(Duration(days: 6, hours: 9, minutes: 16)),
            dateTimeTo:
                DateTime.now().add(Duration(days: 6, hours: 13, minutes: 7)),
            locationFrom: 'Львів',
            locationTo: tripLocation.getSafeString('Варшава'),
          ),
          TransportOption(
            dateTimeFrom:
                DateTime.now().add(Duration(days: 6, hours: 10, minutes: 4)),
            dateTimeTo:
                DateTime.now().add(Duration(days: 6, hours: 15, minutes: 28)),
            locationFrom: 'Київ',
            locationTo: tripLocation.getSafeString('Варшава'),
          ),
          TransportOption(
            dateTimeFrom:
                DateTime.now().add(Duration(days: 6, hours: 12, minutes: 49)),
            dateTimeTo:
                DateTime.now().add(Duration(days: 6, hours: 18, minutes: 19)),
            locationFrom: 'Київ',
            locationTo: tripLocation.getSafeString('Варшава'),
          ),
        ],
      );

      backTickets.addAll(
        <Widget>[
          TransportOption(
            dateTimeFrom:
                DateTime.now().add(Duration(days: 13, hours: 8, minutes: 11)),
            dateTimeTo:
                DateTime.now().add(Duration(days: 13, hours: 12, minutes: 15)),
            locationTo: 'Львів',
            locationFrom: tripLocation.getSafeString('Варшава'),
          ),
          TransportOption(
            dateTimeFrom:
                DateTime.now().add(Duration(days: 13, hours: 9, minutes: 16)),
            dateTimeTo:
                DateTime.now().add(Duration(days: 13, hours: 13, minutes: 7)),
            locationTo: 'Львів',
            locationFrom: tripLocation.getSafeString('Варшава'),
          ),
          TransportOption(
            dateTimeFrom:
                DateTime.now().add(Duration(days: 13, hours: 10, minutes: 4)),
            dateTimeTo:
                DateTime.now().add(Duration(days: 13, hours: 15, minutes: 28)),
            locationTo: 'Київ',
            locationFrom: tripLocation.getSafeString('Варшава'),
          ),
          TransportOption(
            dateTimeFrom:
                DateTime.now().add(Duration(days: 13, hours: 12, minutes: 49)),
            dateTimeTo:
                DateTime.now().add(Duration(days: 4, hours: 18, minutes: 19)),
            locationTo: 'Київ',
            locationFrom: tripLocation.getSafeString('Варшава'),
          ),
        ],
      );

      setState(() {
        _pages.addAll([
          ChooseTransport(
            title: 'Оберіть квиток:',
            tickets: tickets,
          ),
          ChooseTransport(
            title: 'Зворотній квиток:',
            tickets: backTickets,
          ),
          ChooseApartment(),
        ]);
      });
    }
    if (_isNextAvailable) {
      setState(() => _selectedIndex++);
    } else {
      Navigator.of(context).pop(Trip(
        name: tripName,
        destination: tripLocation ?? '',
        dates: tripDate,
        image:
            'https://i2.wp.com/guruturizma.ru/wp-content/uploads/2016/04/Barcelona-beach.jpg?fit=1280%2C853&ssl=1',
        tickets: tripTicket,
        apartments: tripAppartament,
      ));
    }
  }

  void _movePrev() {
    if (_isPrevAvailable) setState(() => _selectedIndex--);
  }

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    // myController.addListener(_printLatestValue);
    _pages = <Widget>[
      Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            Text(
              'Введіть назву подорожі',
              style: TextStyle(fontSize: 23),
            ),
            Container(
              child: TextField(
                controller: myController,
                onChanged: (value) {
                  tripName = value;
                },
              ),
              width: 300,
            ),
            SizedBox(
              height: 50,
            ),
            CitySearch(
              onSelect: (value) {
                tripLocation = value;
              },
            ),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.only(top: 100),
        height: 400,
        child: SfDateRangePicker(
          onSelectionChanged: _onSelectionChanged,
          selectionMode: DateRangePickerSelectionMode.range,
        ),
      ),
      // ListView.builder(
      //   itemCount: tickets.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return tickets[index];
      //   },
      // ),
      // ChooseTransport(
      //   tickets: tickets,
      // ),
      // ChooseApartment(),
      // Padding(
      //   padding: EdgeInsets.all(16.0),
      //   child: Column(
      //     children: [
      //       SizedBox(height: 100),
      //       Text('Choose transport'),
      //     ],
      //   ),
      // ),
      // Padding(
      //   padding: EdgeInsets.all(16.0),
      //   child: Column(
      //     children: [
      //       SizedBox(height: 100),
      //       Text('Choose transport'),

      //       // ChooseTransport(),
      //     ],
      //   ),
      // ),
    ];
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    final value = args.value;
    if (value is DateTime) {
      tripDate = value.niceDate;
    } else if (value is PickerDateRange) {
      tripDate =
          value.startDate!.niceDate + ' - ' + (value.endDate?.niceDate ?? '');
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final bool moveBack = !_isPrevAvailable;
        _movePrev();
        return moveBack;
      },
      child: Scaffold(
        appBar: buildAppBar(context),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            IndexedStack(
              children: _pages,
              index: _selectedIndex,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 80.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: _isPrevAvailable ? _movePrev : null,
                    icon: Icon(Icons.arrow_back_ios),
                    iconSize: 38,
                  ),
                  IconButton(
                    onPressed: _moveNext,
                    icon: Icon(Icons.arrow_forward_ios),
                    iconSize: 38,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension FineDate on DateTime {
  String get niceDate {
    return '$day/$month/$year';
  }
}
