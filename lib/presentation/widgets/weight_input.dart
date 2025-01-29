import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WeightCapture extends StatefulWidget {
  final Function(double) onWeightEntered; // Callback function to pass weight
  const WeightCapture({Key? key, required this.onWeightEntered})
      : super(key: key);

  @override
  _WeightCaptureState createState() => _WeightCaptureState();
}

class _WeightCaptureState extends State<WeightCapture> {
  final TextEditingController _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Weigh Product'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Simulated scale here...'),
          SizedBox(
            height: 10.0,
          ),
          TextField(
            controller: _weightController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Weight',
            ),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            onEditingComplete: () => setState(() {}),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,3}$')),
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
            double? weight = double.tryParse(_weightController.text);
            if (weight != null && weight > 0) {
              widget.onWeightEntered(weight);
            }
          },
          child: const Text('Add to Cart'),
        ),
      ],
    );
  }
}
