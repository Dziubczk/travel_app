import 'package:flutter/material.dart';
import 'package:travel_app/controller/places_api_controller.dart';

class AddressSearch extends SearchDelegate<Suggestion> {
  AddressSearch(this.sessionToken) : apiClient = PlaceApiProvider(sessionToken);

  final sessionToken;
  PlaceApiProvider apiClient;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: 'Clear',
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, Suggestion("", ""));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: query == ""
          ? null
          : apiClient.fetchSuggestions(
              query, Localizations.localeOf(context).languageCode),
      builder: (context, AsyncSnapshot<List<Suggestion>> snapshot) {
        if (query == '')
          return Container(
            padding: EdgeInsets.all(16.0),
            child: Text('Enter your address'),
          );
        if (snapshot.hasData)
          return ListView.builder(
            itemBuilder: (context, index) => ListTile(
              title: Text((snapshot.data![index]).description),
              onTap: () {
                close(context, snapshot.data![index]);
              },
            ),
            itemCount: snapshot.data!.length,
          );
        return Container(child: Text('Loading...'));
      },
    );
  }
}
