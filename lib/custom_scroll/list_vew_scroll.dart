import 'package:flutter/material.dart';
import 'package:flutter_interactive_viewer/custom_scroll/custom_scroll_physics.dart';

import 'helper.dart';

class ListViewScroll extends StatefulWidget {
  const ListViewScroll({Key? key}) : super(key: key);

  @override
  State<ListViewScroll> createState() => _ListViewScrollState();
}

class _ListViewScrollState extends State<ListViewScroll> {
  final _helper = Helper();
  late final ScrollController _controller;
  ScrollPhysics? _physics;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.position.haveDimensions && _physics == null) {
        setState(() {
          final dimension = _controller.position.maxScrollExtent / (_helper.pages.length - 1);
          _physics = CustomScrollPhysics(itemDimension: dimension);
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: _physics,
      controller: _controller,
      itemCount: _helper.pages.length,
      itemBuilder: (context, index) {
        final color = _helper.randomColor;
        final invertColor = _helper.invert(color);
        return Container(
          height: double.infinity,
          width: size.width - 40,
          color: color,
          margin: const EdgeInsets.all(20.0),
          child: Center(
            child: Text(
              '${index + 1}',
              style: Theme.of(context).textTheme.headline1?.copyWith(color: invertColor, fontWeight: FontWeight.w900),
            ),
          ),
        );
      },
    );
  }

// Color _invertColor(Color color) {
//   return Color.fromARGB(color.alpha, _invert(color.red), _invert(color.green), _invert(color.blue));
// }
//
// int _invert(int n) {
//   return (255 - n).abs();
// }
}
