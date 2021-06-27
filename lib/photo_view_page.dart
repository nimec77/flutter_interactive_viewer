import 'package:flutter/material.dart';

// const String imageUrl =
//     'https://www.wallpapers13.com/wp-content/uploads/2016/01/Beautiful-lake-mountain-forest-desktop-wallpapers.jpg';
const String imageUrl = 'https://images8.alphacoders.com/879/879439.jpg';

class PhotoViewPage extends StatelessWidget {
  const PhotoViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InteractiveViewer(
        alignPanAxis: true,
        maxScale: 10,
        child: Image.network(imageUrl),
      ),
    );
  }
}
