import 'package:flutter/material.dart';
import 'package:product_category/entities/category.dart';
import 'package:product_category/entities/product.dart';
import 'package:product_category/services/category_service.dart';
import 'package:product_category/services/product_service.dart';
import 'package:provider/provider.dart';

class ProductFormPage extends StatefulWidget {
  final Product? product;

  const ProductFormPage({super.key, this.product});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  //final TextEditingController _categoryIdController = TextEditingController();
  bool _isDisponible = true;
  int? _selectedCategoryId;
  List<Category> _categories = [];

  @override
  void initState() {
    super.initState();

    final categoryService = Provider.of<CategoryService>(context, listen: false);
    _categories = categoryService.findAll;
    
    if (widget.product != null) {
      _nameController.text = widget.product!.name;
      //_categoryIdController.text = widget.product!.categoryId.toString();
      _isDisponible = widget.product!.isDisponible;
      _selectedCategoryId = widget.product!.categoryId;
    }
  }

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<ProductService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text(widget.product == null ? 'Add Product' : 'Edit Product')),
      
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Product Name'),
                validator: (value) => value!.isEmpty ? 'Enter a product name' : null,
              ),
              /*TextFormField(
                controller: _categoryIdController,
                decoration: const InputDecoration(labelText: 'Category Id'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Enter a Category Id' : null,
              ),*/
              DropdownButtonFormField<int>(
                value: _selectedCategoryId,
                decoration: const InputDecoration(labelText: 'Category'),
                items: _categories.map((category) {
                  return DropdownMenuItem<int>(
                    value: category.id,
                    child: Text(category.name),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategoryId = value;
                  });
                },
                validator: (value) => value == null ? 'Select a category' : null,
              ),

              SwitchListTile(
                title: const Text("Is Disponible"),
                value: _isDisponible,
                onChanged: (bool value) {
                  setState(() {
                    _isDisponible = value;
                  });
                },
              ),
              
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final id = widget.product?.id ?? 0;
                    final name = _nameController.text;
                    //final categoryId = int.tryParse(_categoryIdController.text) ?? 0;
                    final categoryId = _selectedCategoryId ?? 0;

                    if (widget.product == null) {
                      service.create(Product(id: 0, name: name, categoryId: categoryId, isDisponible: _isDisponible));
                    } else {
                      service.update(Product(id: id, name: name, categoryId: categoryId, isDisponible: _isDisponible));
                    }

                    Navigator.pop(context);
                  }
                }, 
                child: Text(widget.product == null ? 'Create' : 'Update'),
              ),
            ],
          ),

        ),
      ),
    );
  }
}