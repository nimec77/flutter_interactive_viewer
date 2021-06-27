import 'package:flutter/material.dart';
import 'package:flutter_interactive_viewer/custom_scroll/helper.dart';

class PageViewScroll extends StatelessWidget {
  PageViewScroll({Key? key}) : super(key: key);

  final _pageController = PageController(viewportFraction: 0.8);
  final _helper = Helper();

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: _helper.pages.length,
      itemBuilder: (context, index) {
        return Container(
          color: _helper.randomColor,
          margin: const EdgeInsets.all(20.0),
        );
      },
    );
  }
}
