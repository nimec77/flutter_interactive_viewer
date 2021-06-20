import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Quad;

import 'entities/types.dart';
import 'helpers/viewport_visible.dart';

class TableBuilder extends StatelessWidget {
  TableBuilder({
    Key? key,
    required this.rowCount,
    required this.columnCount,
    required this.cellWidth,
    required this.cellHeight,
    required this.viewport,
    required this.builder,
  })  : _viewportVisible = ViewportVisible(cellWidth, cellHeight),
        assert(rowCount > 0),
        assert(columnCount > 0),
        super(key: key);

  final int rowCount;
  final int columnCount;
  final double cellWidth;
  final double cellHeight;
  final Quad viewport;
  final CellBuilder builder;
  final ViewportVisible _viewportVisible;

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: <int, TableColumnWidth>{
        for (var column = 0; column < columnCount; ++column) column: FixedColumnWidth(cellWidth)
      },
      children: [
        for (var row = 0; row < rowCount; ++row)
          TableRow(
              children: [for (var column = 0; column < columnCount; ++column) _builder(context, viewport, row, column)])
      ],
    );
  }

  Widget _builder(BuildContext context, Quad viewport, int row, int column) {
    if (!_viewportVisible.isCellVisible(row, column, viewport)) {
      return SizedBox(height: cellHeight);
    }
    return builder(context, row, column);
  }
}
