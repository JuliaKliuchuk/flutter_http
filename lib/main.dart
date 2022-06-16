import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTP'),
      ),
      body: Container(),
    );
  }

  Future<http.Response> getData() async {
    const url = 'http://about.google/static/data/locations.json';
    return await http.get(Uri.parse(url));
  }

  void loadData() {
    getData().then((response) {
      if (response.statusCode == 200) {
        // print(response.statusCode);
        // print('response.body ---- ${response.body}');
      } else {
        // print(response.statusCode);
      }
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }
}
