import 'package:flutter/material.dart';
import 'package:flutter_interactive_viewer/interactive_page.dart';

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
      home: const Scaffold(
        body: InteractivePage(
          cellWidth: 200,
          cellHeight: 200,
          rowCount: 1000,
          columnCount: 1000,
        ),
      ),
    );
  }
}
