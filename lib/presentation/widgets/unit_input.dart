import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UnitCapture extends StatefulWidget {
  final Function(int) onUnitEntered; // Callback function to pass weight
  const UnitCapture({Key? key, required this.onUnitEntered}) : super(key: key);

  @override
  _UnitCaptureState createState() => _UnitCaptureState();
}

class _UnitCaptureState extends State<UnitCapture> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Enter Quantity'),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          width: 200.0,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  if (_quantity > 1) {
                    setState(() {
                      _quantity--;
                      _quantityController.text = _quantity.toString();
                    });
                  }
                },
              ),
              SizedBox(
                width: 80.0,
                child: TextField(
                  controller: _quantityController,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 26.0),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    _quantity++;
                    _quantityController.text = _quantity.toString();
                  });
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context), // cancel
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (_quantity > 0) {
              widget.onUnitEntered(_quantity);
            }
          },
          child: const Text('Add to Cart'),
        ),
      ],
    );
  }

  int _quantity = 1;
  final TextEditingController _quantityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _quantityController.text = _quantity.toString();
  }
}
