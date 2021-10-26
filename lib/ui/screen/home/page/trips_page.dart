import 'package:flutter/material.dart';
import 'package:travel_app/constants.dart';

class TripsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 38,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(MEW);
        },
      ),
      body: Column(
        children: [
          Icon(Icons.ac_unit, size: 350),
        ],
      ),
    );
  }
}
