import 'package:flutter/material.dart';
import 'package:pos_meat_shop/presentation/widgets/datatable.dart';

/// Flutter code sample for [DataTable].

void main() => runApp(const SyncPage());

class SyncPage extends StatelessWidget {
  const SyncPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sync Items'),
        actions: [
          IconButton(
            // Add date filter modal
            onPressed: () {},
            icon: Icon(Icons.filter_alt_outlined),
          ),
        ],
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: DataTableExample(),
    );
  }
}

class DataTableExample extends StatefulWidget {
  const DataTableExample({super.key});

  @override
  State<DataTableExample> createState() => _DataTableExampleState();
}

class _DataTableExampleState extends State<DataTableExample> {
  static const int numItems = 20;
  List<bool> selected = List<bool>.generate(numItems, (int index) => false);

  final List<Map<String, dynamic>> sampleData = [
    {"name": "Alice", "age": 30, "job": "Engineer"},
    {"name": "Bob", "age": 25, "job": "Designer"},
    {"name": "Charlie", "age": 35, "job": "Manager"},
    {"name": "David", "age": 28, "job": "Developer"},
    {"name": "Eva", "age": 32, "job": "Designer"},
    {"name": "Frank", "age": 29, "job": "Engineer"},
    {"name": "Grace", "age": 31, "job": "Developer"},
    {"name": "Henry", "age": 33, "job": "Manager"},
    {"name": "Ivy", "age": 27, "job": "Designer"},
    {"name": "Jack", "age": 34, "job": "Developer"},
    {"name": "Kate", "age": 26, "job": "Designer"},
    {"name": "Liam", "age": 31, "job": "Engineer"},
    {"name": "Mia", "age": 29, "job": "Developer"},
    {"name": "Nathan", "age": 33, "job": "Manager"},
    {"name": "Olivia", "age": 28, "job": "Designer"},
    {"name": "Peter", "age": 30, "job": "Developer"},
    {"name": "Quinn", "age": 27, "job": "Designer"},
    {"name": "Riley", "age": 32, "job": "Engineer"},
    {"name": "Sophia", "age": 29, "job": "Developer"},
    {"name": "Thomas", "age": 33, "job": "Manager"},
    {"name": "Uma", "age": 28, "job": "Designer"},
    
  ];

  final List<String> columns = ["name", "age", "job"];

  @override
  Widget build(BuildContext context) {
    // return MyWidget(numItems: 20,);
    return ReusableDataTable(
      // Define the columns you want to show. Ensure the keys match those in the row data.
      columns: const ["name", "age", "job"],
      data: sampleData,
    );
  }
}

class MyWidget extends StatelessWidget {
  final int numItems;
  MyWidget({super.key, required this.numItems});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Text('Number'),
          ),
        ],
        rows: List<DataRow>.generate(
          numItems,
          (int index) => DataRow(
            color: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
              // All rows will have the same selected color.
              if (states.contains(WidgetState.selected)) {
                return Theme.of(context).colorScheme.primary.withOpacity(0.08);
              }
              // Even rows will have a grey color.
              if (index.isEven) {
                return Colors.grey.withOpacity(0.3);
              }
              return null; // Use default value for other states and odd rows.
            }),
            cells: <DataCell>[DataCell(Text('Row $index'))],
            selected: false,
            onSelectChanged: (bool? value) {},
          ),
        ),
      ),
    );
  }
}
