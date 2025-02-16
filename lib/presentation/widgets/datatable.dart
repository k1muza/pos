import 'package:flutter/material.dart';

class ReusableDataTable extends StatelessWidget {
  /// The column names to display in the table header.
  final List<String> columns;

  /// The list of row data, where each row is a map with keys matching the column names.
  final List<Map<String, dynamic>> data;

  final Function? onRowSelected;

  const ReusableDataTable({
    Key? key,
    required this.columns,
    required this.data,
    this.onRowSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // LayoutBuilder provides the maxWidth of the parent.
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          // ConstrainedBox forces the child (DataTable) to have at least the width of its parent.
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: constraints.maxWidth),
            child: DataTable(
              // Create DataColumn widgets from the list of column names.
              columns: columns
                  .map(
                    (column) => DataColumn(
                      label: Text(
                        column.toUpperCase(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                  .toList(),
              // Create DataRow widgets for each data entry.
              rows: data
                  .asMap()
                  .entries
                  .map(
                    (entry) => DataRow(
                      cells: columns
                          .map((col) => DataCell(Text(entry.value[col]?.toString() ?? '')))
                          .toList(),
                      color: WidgetStateProperty.resolveWith<Color?>(
                          (Set<WidgetState> states) {
                        // Even rows will have a grey color.
                        if (entry.key.isEven) {
                          return Colors.grey.withOpacity(0.3);
                        }
                        return null; // Use default value for other states and odd rows.
                      }),
                      selected: false,
                      onSelectChanged: (bool? value) {
                        if (onRowSelected != null) {
                          onRowSelected!(entry.value);
                        }
                      },                     
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
