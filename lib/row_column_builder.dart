import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Quad;

import 'entities/types.dart';
import 'helpers/viewport_visible.dart';

class RowColumnBuilder extends StatelessWidget {
  RowColumnBuilder({
    Key? key,
    this.rowCount = 100,
    this.columnCount = 100,
    required this.cellWidth,
    required this.cellHeight,
    required this.viewport,
    required this.builder,
  })  : _viewportVisible = ViewportVisible(cellWidth, cellHeight),
        assert(rowCount > 0),
        assert(columnCount > 0),
        super(key: key);

  final double cellWidth;
  final double cellHeight;
  final CellBuilder builder;
  final Quad viewport;
  final int rowCount;
  final int columnCount;
  final ViewportVisible _viewportVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var row = 0; row < rowCount; ++row)
          Row(
            children: [
              for (var column = 0; column < columnCount; ++column) _build(context, viewport, row, column),
            ],
          ),
      ],
    );
  }

  Widget _build(BuildContext context, Quad viewport, int row, int column) {
    if (!_viewportVisible.isCellVisible(row, column, viewport)) {
      return SizedBox(width: cellWidth, height: cellHeight);
    }
    return builder(context, row, column);
  }
}
