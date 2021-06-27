import 'dart:math' as math;
import 'dart:ui';

class Helper {
  Helper() {
    pages = List<int>.generate(_random.nextInt(90) + 10, (index) => index);
  }

  final _random = math.Random();
  late final List<int> pages;

  Color get randomColor => Color(_random.nextInt(0xFFFFFF)).withOpacity(1.0);

  Color invert(Color color) {
    final r = (0xFF - color.red).abs();
    final g = (0xFF - color.green).abs();
    final b = (0xFF - color.blue).abs();
    return Color.fromARGB(color.alpha, r, g, b);
  }
}
