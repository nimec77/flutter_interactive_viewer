import 'package:flutter/material.dart';

class ListScrollPage extends StatefulWidget {
  const ListScrollPage({Key? key}) : super(key: key);

  @override
  _ListScrollPageState createState() => _ListScrollPageState();
}

class _ListScrollPageState extends State<ListScrollPage> {
  final length = 100;
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            width: 300,
            color: Colors.red,
          ),
          Container(
            width: 300,
            color: Colors.orange,
          ),
          Container(
            width: 300,
            color: Colors.yellow,
          ),
          Container(
            width: 300,
            color: Colors.green,
          ),
          Container(
            width: 300,
            color: Colors.lightBlue,
          ),
          Container(
            width: 300,
            color: Colors.blue,
          ),
          Container(
            width: 300,
            color: Colors.purple,
          ),
        ],
      ),
    );
  }
}
