import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:travel_app/ui/screen/choose_apartment.dart';
import 'package:travel_app/ui/screen/choose_transport.dart';
import 'package:travel_app/ui/screen/city_search.dart';


class Mew extends StatefulWidget {
  @override
  _MewState createState() => _MewState();
}

class _MewState extends State<Mew> {
  final myController = TextEditingController();
  final searchController = TextEditingController();

  int _selectedIndex = 0;
  late List<Widget> _pages;

  bool get _isNextAvailable => _selectedIndex < _pages.length - 1;

  bool get _isPrevAvailable => _selectedIndex > 0;

  void _moveNext() {
    if (_isNextAvailable) setState(() => _selectedIndex++);
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
            Text('Введіть назву подорожі', style: TextStyle(fontSize: 23),),
            Container(
              child: TextField(
                controller: myController,
              ),
              width: 300,
            ),
            SizedBox(
              height: 50,
            ),
            CitySearch(),
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
      ChooseTransport(),
      ChooseApartment(),
      Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 100),
            Text('Choose transport'),


          ],
        ),
      ),

      Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 100),
            Text('Choose transport'),

            // ChooseTransport(),
          ],
        ),
      ),
    ];
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    // TODO: implement your code here
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
        final bool moveBack =!_isPrevAvailable;
         _movePrev();
        return moveBack;
      },
      child: Scaffold(
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
                    onPressed: _isNextAvailable ? _moveNext : null,
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
