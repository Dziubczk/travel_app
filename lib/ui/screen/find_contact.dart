import 'package:flutter/material.dart';
import 'package:travel_app/controller/places_api_controller.dart';
import 'package:uuid/uuid.dart';

import '../../address_search.dart';

class FindContact extends StatefulWidget {
  const FindContact({Key? key}) : super(key: key);

  @override
  _FindContactState createState() => _FindContactState();
}

class _FindContactState extends State<FindContact> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget.title"),
      ),
      body: Column(
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
                  Icons.home,
                  color: Colors.black,
                ),
              ),
              hintText: "Enter your shipping address",
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 8.0, top: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
