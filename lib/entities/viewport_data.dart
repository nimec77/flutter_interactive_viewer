class ViewportData {
  const ViewportData({
    required this.firstVisibleRow,
    required this.firstVisibleColumn,
    required this.lastVisibleRow,
    required this.lastVisibleColumn,
  });

  final int firstVisibleRow;
  final int firstVisibleColumn;
  final int lastVisibleRow;
  final int lastVisibleColumn;

  bool include(int row, int column) {
    return row >= firstVisibleRow &&
        row <= lastVisibleRow &&
        column >= firstVisibleColumn &&
        column <= lastVisibleColumn;
  }
}
