import 'dart:convert';

import 'package:http/http.dart' as http;

class OfficesList {
  List<Office> offices;
  OfficesList({required this.offices});

  factory OfficesList.fromJson(Map<String, dynamic> json) {
    var officessJson = json['offices'] as List;

    List<Office> officessList =
        officessJson.map((el) => Office.fromJson(el)).toList();

    return OfficesList(
      offices: officessList,
    );
  }
}

class Office {
  final String name;
  final String address;
  final String image;

  Office({
    required this.name,
    required this.address,
    required this.image,
  });

  factory Office.fromJson(Map<String, dynamic> json) {
    return Office(
      name: json['name'] as String,
      address: json['address'] as String,
      image: json['image'] as String,
    );
  }
}

Future<OfficesList> getOfficesList() async {
  const url = 'http://about.google/static/data/locations.json';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return OfficesList.fromJson(json.decode(response.body));
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}
