import 'package:flutter/material.dart';

class InteractiveViewerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const int _rowCount = 20;
    const int _columnCount = 10;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          child: InteractiveViewer(
            constrained: false,
            child: Table(
              columnWidths: <int, TableColumnWidth>{
                for (int column = 0; column < _columnCount; column += 1)
                  column: const FixedColumnWidth(100.0),
              },
              children: <TableRow>[
                for (int row = 0; row < _rowCount; row += 1)
                  TableRow(
                    children: <Widget>[
                      for (int column = 0; column < _columnCount; column += 1)
                        Container(
                          height: 50,
                          color: row % 2 + column % 2 == 1
                              ? Colors.red
                              : Colors.green,
                        ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
