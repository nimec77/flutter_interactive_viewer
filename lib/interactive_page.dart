import 'package:flutter/material.dart';
import 'package:flutter_interactive_viewer/row_column_builder.dart';

class InteractivePage extends StatefulWidget {
  const InteractivePage({
    Key? key,
    required this.cellWidth,
    required this.cellHeight,
    this.rowCount = 100,
    this.columnCount = 100,
  }) : super(key: key);

  final double cellWidth;
  final double cellHeight;
  final int rowCount;
  final int columnCount;

  @override
  _InteractivePageState createState() => _InteractivePageState();
}

class _InteractivePageState extends State<InteractivePage> {
  late final TransformationController _transformationController;

  @override
  void initState() {
    super.initState();
    _transformationController = TransformationController();
    _transformationController.addListener(_onChangeTransformation);
  }

  @override
  void dispose() {
    _transformationController
      ..removeListener(_onChangeTransformation)
      ..dispose();
    super.dispose();
  }

  void _onChangeTransformation() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return InteractiveViewer.builder(
            alignPanAxis: false,
            scaleEnabled: false,
            transformationController: _transformationController,
            builder: (context, viewport) {
              return RowColumnBuilder(
                rowCount: widget.rowCount,
                columnCount: widget.columnCount,
                cellWidth: widget.cellWidth,
                cellHeight: widget.cellHeight,
                viewport: viewport,
                builder: (context, row, column) {
                  return Container(
                    width: widget.cellWidth,
                    height: widget.cellHeight,
                    color: row % 2 + column % 2 == 1 ? Colors.white : Colors.grey.withOpacity(0.1),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '$row x $column',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
