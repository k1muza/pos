import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UnitCapture extends StatefulWidget {
  final Function(int) onUnitEntered; // Callback function to pass weight
  const UnitCapture({Key? key, required this.onUnitEntered})
      : super(key: key);

  @override
  _UnitCaptureState createState() => _UnitCaptureState();
}

class _UnitCaptureState extends State<UnitCapture> {
  final TextEditingController _unitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Number of Products'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Simulated scale here...'),
          SizedBox(
            height: 10.0,
          ),
          TextField(
            controller: _unitController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Quantity',
            ),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onEditingComplete: () => setState(() {}),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          )
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context), // cancel
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            int? weight = int.tryParse(_unitController.text);
            if (weight != null && weight > 0) {
              widget.onUnitEntered(weight);
            }
          },
          child: const Text('Add to Cart'),
        ),
      ],
    );
  }
}

