import 'package:flutter/material.dart';
import 'package:product_category/view/category/category_list_page.dart';
import 'package:product_category/view/product/product_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Product & Categories')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // alinha no centro horizontalmente
        children: [
          const SizedBox(height: 10),
          Center( // botões alinhados centralmente
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (_) => const ProductListPage()),
                  ), 
                  child: const Text('Products'),
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (_) => const CategoryListPage()),
                  ), 
                  child: const Text('Categories'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
