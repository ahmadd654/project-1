import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiWidgets extends StatelessWidget {
  Future<List<dynamic>> fetchData() async {
    var url = 'http://ahamd.kesug.com/api/data';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,  // Ensure data exists and is not null
              itemBuilder: (context, index) {
                // Access data with explicit null checks and fallbacks
                return ListTile(
                  title: Text(snapshot.data![index]['title'] ?? 'No title provided'),
                  subtitle: Text(snapshot.data![index]['description'] ?? 'No description provided'),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else {
            return Center(child: Text("No data available"));
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
