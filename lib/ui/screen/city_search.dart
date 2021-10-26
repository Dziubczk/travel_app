import 'package:flutter/material.dart';
import 'package:travel_app/ui/component/address_search.dart';
import 'package:travel_app/controller/places_api_controller.dart';
import 'package:uuid/uuid.dart';

class CitySearch extends StatefulWidget {
  const CitySearch({Key? key}) : super(key: key);

  @override
  _CitySearchState createState() => _CitySearchState();
}

class _CitySearchState extends State<CitySearch> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: _controller,
          readOnly: true,
          onTap: () async {
            // generate a new token here
            final sessionToken = Uuid().v4();
            final Suggestion? result = await showSearch(
              context: context,
              delegate: AddressSearch(sessionToken),
            );
            // This will change the text displayed in the TextField
            if (result != null) {
              setState(() {
                _controller.text = result.description;
              });
            }
          },
          decoration: InputDecoration(
            icon: Container(
              margin: EdgeInsets.only(left: 20),
              width: 10,
              height: 10,
              child: Icon(
                Icons.place_outlined,
                // color: Colors.black,
              ),
            ),
            hintText: "Enter city you want shototam",
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 8.0, top: 16.0),
          ),
        ),
      ],
    );
  }
}
