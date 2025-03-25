import 'package:flutter/material.dart';
import 'package:product_category/entities/product.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details: ${product.name}')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text('Name: ${product.name}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('Category Id: ${product.categoryId}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text('Disponible:', style: TextStyle(fontSize: 18)),
                const SizedBox(width: 8),
                Icon(
                  product.isDisponible ? Icons.check_circle : Icons.cancel,
                  color: product.isDisponible ? Colors.green : Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 20),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}