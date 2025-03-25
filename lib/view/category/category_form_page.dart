import 'package:flutter/material.dart';
import 'package:product_category/entities/category.dart';
import 'package:product_category/services/category_service.dart';
import 'package:provider/provider.dart';

class CategoryFormPage extends StatefulWidget {
  final Category? category;

  const CategoryFormPage({super.key, this.category});

  @override
  State<CategoryFormPage> createState() => _CategoryFormPageState();
}

class _CategoryFormPageState extends State<CategoryFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.category != null) {
      _nameController.text = widget.category!.name;
    }
  }

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<CategoryService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text(widget.category == null ? 'Add Category' : 'Edit Category')),
      
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Category Name'),
                validator: (value) => value!.isEmpty ? 'Enter a Category name' : null,
              ),
              
              
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final id = widget.category?.id ?? 0;
                    final name = _nameController.text;

                    if (widget.category == null) {
                      service.create(Category(id: 0, name: name));
                    } else {
                      service.update(Category(id: id, name: name));
                    }

                    Navigator.pop(context);
                  }
                }, 
                child: Text(widget.category == null ? 'Create' : 'Update'),
              ),
            ],
          ),

        ),
      ),
    );
  }
}