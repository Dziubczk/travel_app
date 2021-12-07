import 'package:flutter/material.dart';
import 'package:travel_app/model/Trip.dart';
import 'package:travel_app/ui/component/appbar_widget.dart';

class TripScreen extends StatefulWidget {
  const TripScreen({Key? key, required this.trip}) : super(key: key);

  final Trip trip;

  @override
  State<TripScreen> createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  bool? isChecked = false;
  bool isWrongPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //     colors: [
        //       Colors.teal,
        //       Colors.teal,
        //     ],
        //   ),
        // ),s
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
            ),
            // .copyWith(top: 60),
            child: Column(
              children: [
                Image(
                  image: NetworkImage(widget.trip.image),
                  fit: BoxFit.fill,
                  height: 200,
                  width: 400,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  widget.trip.destination,
                  style: TextStyle(
                    fontFamily: 'PT-Sans',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.trip.dates,
                  style: TextStyle(
                    fontFamily: 'PT-Sans',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Tickets: ${widget.trip.tickets}',
                  style: TextStyle(
                    fontFamily: 'PT-Sans',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Apartaments ${widget.trip.apartments}',
                  style: TextStyle(
                    fontFamily: 'PT-Sans',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Нотатки',
                    style: TextStyle(
                      fontFamily: 'PT-Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Material(
                  color: Colors.transparent,
                  elevation: 2,
                  child: TextField(
                    cursorColor: Colors.white,
                    cursorWidth: 2,
                    maxLines: 12,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      // fillColor:
                      // Color(0xFF5180ff),
                      // Colors.teal[700],
                      // prefixIcon: prefixedIcon,
                      hintText: 'Введіть ваші нотатки',
                      hintStyle: const TextStyle(
                        color: Colors.white54,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'PTSans',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
