
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interactive_viewer/custom_scroll/custom_scroll.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // scrollBehavior: const MaterialScrollBehavior().copyWith(platform: TargetPlatform.android),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: SafeArea(
          child: ListViewScroll(),
        ),
      ),
    );
  }
}
