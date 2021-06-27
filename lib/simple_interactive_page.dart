import 'package:flutter/material.dart';

class SimpleInteractivePage extends StatelessWidget {
  const SimpleInteractivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer.builder(
      builder: (context, viewport) {
        return Row(
          children: [
            Container(
              width: 300,
              height: 200,
              color: Colors.red,
            ),
            Container(
              width: 300,
              height: 200,
              color: Colors.orange,
            ),
            Container(
              width: 300,
              height: 200,
              color: Colors.yellow,
            ),
            Container(
              width: 300,
              height: 200,
              color: Colors.green,
            ),
            Container(
              width: 300,
              height: 200,
              color: Colors.lightBlue,
            ),
            Container(
              width: 300,
              height: 200,
              color: Colors.blue,
            ),
            Container(
              width: 300,
              height: 200,
              color: Colors.purple,
            ),
          ],
        );
      },
    );
  }
}
