import 'package:flutter/material.dart';

class ContainerScrollPage extends StatelessWidget {
  const ContainerScrollPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.horizontal,
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            width: 5000,
            height: 200,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.red,
                  Colors.orange,
                  Colors.yellow,
                  Colors.green,
                  Colors.lightBlue,
                  Colors.blue,
                  Colors.purple,
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
