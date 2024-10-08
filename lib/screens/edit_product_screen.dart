import 'package:flutter/material.dart';
import '/data/product_data.dart';

class EditProductScreen extends StatefulWidget {
  final Product product;

  const EditProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  late TextEditingController _codeController;
  late TextEditingController _nameController;
  late TextEditingController _specificationController;
  late TextEditingController _priceController;

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController(text: widget.product.code);
    _nameController = TextEditingController(text: widget.product.name);
    _specificationController =
        TextEditingController(text: widget.product.specification);
    _priceController =
        TextEditingController(text: widget.product.price.toString());
  }

  @override
  Widget build(BuildContext context) {
    // Определение, находится ли устройство в горизонтальной ориентации
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    // Установка отступов: больше в горизонтальной ориентации
    EdgeInsets padding = isLandscape
        ? const EdgeInsets.symmetric(horizontal: 48.0)
        : const EdgeInsets.all(16.0);

    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Product'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: padding,
            child: Column(
              children: [
                TextField(
                  controller: _codeController,
                  decoration: InputDecoration(labelText: 'Code'),
                  readOnly: true,
                ),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                  readOnly: true,
                ),
                TextField(
                  controller: _specificationController,
                  decoration: InputDecoration(labelText: 'Specification'),
                ),
                TextField(
                  controller: _priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Price'),
                ),
                SwitchListTile(
                  title: Text('In Stock'),
                  value: widget.product.inStock,
                  onChanged: (bool value) {
                    setState(() {
                      widget.product.inStock = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Is Watched'),
                  value: widget.product.isWatched,
                  onChanged: (bool value) {
                    setState(() {
                      widget.product.isWatched = value;
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    // Save logic or update the state in your app
                    Navigator.pop(context);
                  },
                  child: Text('Save Changes'),
                )
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    _codeController.dispose();
    _nameController.dispose();
    _specificationController.dispose();
    _priceController.dispose();
    super.dispose();
  }
}
