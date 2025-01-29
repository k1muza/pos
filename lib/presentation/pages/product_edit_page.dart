import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pos_meat_shop/data/database/app_database.dart';
import 'package:pos_meat_shop/domain/providers/product_provider.dart';

enum FormStatus { initial, submitting, success, failure }

@immutable
class FormState {
  final String name;
  final double unitPrice;
  final String unit;
  final bool isActive;
  final String? nameError;
  final String? unitPriceError;
  final String? unitError;
  final FormStatus status;
  final String? submissionError;

  const FormState({
    this.name = '',
    this.unitPrice = 0.0,
    this.unit = '',
    this.isActive = true,
    this.nameError,
    this.unitPriceError,
    this.unitError,
    this.status = FormStatus.initial,
    this.submissionError,
  });

  FormState copyWith({
    String? name,
    double? unitPrice,
    String? unit,
    bool? isActive,
    String? nameError,
    String? unitPriceError,
    String? unitError,
    FormStatus? status,
    String? submissionError,
  }) {
    return FormState(
      name: name ?? this.name,
      unitPrice: unitPrice ?? this.unitPrice,
      unit: unit ?? this.unit,
      isActive: isActive ?? this.isActive,
      nameError: nameError,
      unitPriceError: unitPriceError,
      unitError: unitError,
      status: status ?? this.status,
      submissionError: submissionError,
    );
  }
}

class FormNotifier extends StateNotifier<FormState> {
  final Product? initialProduct;

  FormNotifier({this.initialProduct})
      : super(FormState(
          name: initialProduct?.name ?? '',
          unitPrice: initialProduct?.unitPrice ?? 0.0,
          unit: initialProduct?.unit ?? '',
          isActive: initialProduct?.isActive ?? true,
        ));

  // Resets the form to its initial state
  void reset() {
    state = FormState(
      name: initialProduct?.name ?? '',
      unitPrice: initialProduct?.unitPrice ?? 0.0,
      isActive: initialProduct?.isActive ?? true,
    );
  }

  // Update email
  void setName(String name) {
    state = state.copyWith(name: name, nameError: null);
  }

  // Update password
  void setUnitPrice(String unitPrice) {
    double? convertedValue;
    try {
      convertedValue = double.parse(unitPrice);
    } catch (e) {
      convertedValue = null; // Handle invalid input
    }
    state = state.copyWith(unitPrice: convertedValue, unitPriceError: null);
  }

  void setUnit(String unit) {
    state = state.copyWith(unit: unit, unitError: null);
  }

  void setIsActive(bool isActive) {
    state = state.copyWith(isActive: isActive);
  }

  // Validate form fields
  bool validate() {
    bool isValid = true;
    String? nameError;
    String? unitPriceError;

    if (state.name.isEmpty) {
      nameError = 'Name cannot be empty';
      isValid = false;
    }

    if (state.unitPrice.isNaN) {
      unitPriceError = 'Price cannot be empty';
      isValid = false;
    }

    state = state.copyWith(
      nameError: nameError,
      unitPriceError: unitPriceError,
    );

    return isValid;
  }

  // Handle form submission
  Future<void> submit(WidgetRef ref) async {
    if (!validate()) return;

    state =
        state.copyWith(status: FormStatus.submitting, submissionError: null);

    try {
      if (initialProduct == null) {
        // Create a new product
        final newProduct = ProductsCompanion(
            name: Value(state.name),
            unitPrice: Value(state.unitPrice),
            unit: Value(state.unit),
            isActive: Value(state.isActive),
            createdAt: Value(DateTime.now().toUtc()));
        await ref.read(productNotifierProvider.notifier).addProduct(newProduct);
      } else {
        // Update an existing product
        final updatedProduct = ProductsCompanion(
          id: Value(initialProduct!.id),
          name: Value(state.name),
          unitPrice: Value(state.unitPrice),
          unit: Value(state.unit),
          isActive: Value(state.isActive),
          createdAt: Value(initialProduct!.createdAt),
        );
        await ref
            .read(productNotifierProvider.notifier)
            .updateProduct(updatedProduct);
      }

      state = state.copyWith(status: FormStatus.success);

      if (initialProduct == null) {
        // Reset the form if adding a new product
        reset();
      }
    } catch (e) {
      state = state.copyWith(
        status: FormStatus.failure,
        submissionError: 'Submission failed. Please try again.',
      );
    }
  }
}

// FormProvider with family to accept productId
final formProvider =
    StateNotifierProvider.family<FormNotifier, FormState, Product?>(
  (ref, product) {
    if (product == null) {
      // No initial product; create an empty form
      return FormNotifier();
    } else {
      return FormNotifier(initialProduct: product);
    }
  },
);

class ProductEditPage extends ConsumerWidget {
  final Product? product;
  const ProductEditPage({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen to formProvider changes
    ref.listen<FormState>(formProvider(product), (previous, next) {
      if (previous?.status != next.status) {
        if (next.status == FormStatus.success) {
          // Optionally, show a Snackbar before navigating back
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Product saved successfully!')),
          );
          // Navigate back after a short delay to allow the Snackbar to show
          Navigator.of(context).pop();
        } else if (next.status == FormStatus.failure &&
            next.submissionError != null) {
          // Optionally, show an error Snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(next.submissionError!)),
          );
        }
      }
    });

    final formNotifier = ref.watch(formProvider(product).notifier);
    final formState = ref.watch(formProvider(product));

    return Scaffold(
      appBar: AppBar(
          title: product != null ? Text('Edit Product') : Text('Add Product')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Email Field
            TextFormField(
              initialValue: formState.name,
              onChanged: formNotifier.setName,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                labelText: 'Name',
                errorText: formState.nameError,
              ),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 16),
            // Password Field
            TextFormField(
              initialValue: formState.unitPrice.toString(),
              onChanged: formNotifier.setUnitPrice,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
              ],
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                labelText: 'UnitPrice',
                errorText: formState.unitPriceError,
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField(
              value: formState.unit.toString(),
              items: [
                DropdownMenuItem(child: Text('kilogram'), value: 'kg'),
                DropdownMenuItem(child: Text('litre'), value: 'L'),
                DropdownMenuItem(child: Text('none'), value: ''),
              ],
              onChanged: (String? value) {
                formNotifier.setUnit(value!);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                labelText: 'Unit',
                errorText: formState.unitError,
              ),
            ),
            const SizedBox(height: 16),
            CheckboxListTile(
                tristate: false,
                title: Text('Sell this product'),
                value: formState.isActive,
                onChanged: (value) {
                    formNotifier.setIsActive(value!);
                }),
            const SizedBox(height: 32),
            // Submit Button
            formState.status == FormStatus.submitting
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      formNotifier.submit(ref);
                    },
                    child: const Text('Save Product'),
                  ),
          ],
        ),
      ),
    );
  }
}
