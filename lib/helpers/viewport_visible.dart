import 'package:flutter/material.dart';
import 'package:flutter_interactive_viewer/entities/viewport_data.dart';
import 'package:vector_math/vector_math_64.dart' show Quad, Vector3;

class ViewportVisible {
  ViewportVisible(this.cellWidth, this.cellHeight);

  final double cellWidth;
  final double cellHeight;
  final Map<Quad, ViewportData> _cachedViewports = {};

  bool isCellVisible(int row, int column, Quad viewport) {
    final ViewportData viewportData;
    if (_cachedViewports.containsKey(viewport)) {
      viewportData = _cachedViewports[viewport]!;
    } else {
      final rect = _axisAlignedBoundingBox(viewport);
      viewportData = ViewportData(
        firstVisibleRow: (rect.top / cellWidth).floor(),
        firstVisibleColumn: (rect.left / cellHeight).floor(),
        lastVisibleRow: (rect.bottom / cellWidth).floor(),
        lastVisibleColumn: (rect.right / cellHeight).floor(),
      );
      _cachedViewports[viewport] = viewportData;
    }
    return _include(row, column, viewportData);
  }

  bool _include(int row, int column, ViewportData viewportData) {
    return row >= viewportData.firstVisibleRow &&
        row <= viewportData.lastVisibleRow &&
        column >= viewportData.firstVisibleColumn &&
        column <= viewportData.lastVisibleColumn;
  }

  Rect _axisAlignedBoundingBox(Quad quad) {
    var xMin = double.infinity;
    var xMax = double.negativeInfinity;
    var yMin = double.infinity;
    var yMax = double.negativeInfinity;

    for (final point in <Vector3>[quad.point0, quad.point1, quad.point2, quad.point3]) {
      if (point.x < xMin) {
        xMin = point.x;
      }
      if (point.x > xMax) {
        xMax = point.x;
      }
      if (point.y < yMin) {
        yMin = point.y;
      }
      if (point.y > yMax) {
        yMax = point.y;
      }
    }

    return Rect.fromLTRB(xMin, yMin, xMax, yMax);
  }
}
