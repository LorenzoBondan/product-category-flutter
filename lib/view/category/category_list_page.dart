import 'package:flutter/material.dart';
import 'package:product_category/services/category_service.dart';
import 'package:product_category/view/category/category_details_page.dart';
import 'package:product_category/view/category/category_form_page.dart';
import 'package:provider/provider.dart';

class CategoryListPage extends StatelessWidget {
  const CategoryListPage({super.key});

  @override 
  Widget build(BuildContext context) {
    final service = Provider.of<CategoryService>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: ListView.builder(
        itemCount: service.findAll.length,
        itemBuilder: (context, index){
          final item = service.findAll[index];
          return ListTile(
            title: Text(item.name),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [

                IconButton(
                  icon: const Icon(Icons.visibility, color: Colors.green),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryDetailsPage(category: item),
                      ),
                    );
                  },
                ),

                IconButton(
                  icon: Icon(Icons.edit), 
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryFormPage(category: item),
                      ),
                    );
                  },
                ),

                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    service.delete(item.id);
                  },
                ),
                
              ],
            ),
          ); 
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CategoryFormPage(),
            ),
          );
        },
      ),
    );
  }
}