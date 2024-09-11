import 'package:flutter/material.dart';
import 'package:statistical_data_recorder/data/product_data.dart';
import 'package:statistical_data_recorder/screens/edit_product_screen.dart';
import 'package:statistical_data_recorder/screens/login_screen.dart';
import '/data/product_data.dart'; // Импортируем новую структуру данных

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<bool> _isOpen = [];
  String _searchQuery = ""; // Переменная для хранения поискового запроса

  @override
  void initState() {
    super.initState();
    _isOpen = List<bool>.filled(stores.length, false);
  }

  // Функция обновления поискового запроса
  void _updateSearchQuery(String newQuery) {
    setState(() {
      _searchQuery = newQuery;
    });
  }

Widget _buildProductTable(Store store) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: DataTable(
      columns: const [
        DataColumn(label: Text('Код')),
        DataColumn(label: Text('Название')),
        DataColumn(label: Text('Характеристика')),
        DataColumn(label: Text('Цена')),
        DataColumn(label: Text('Наличие')),
        DataColumn(label: Text('Наблюдение')),
        DataColumn(label: Text('Действия')),
      ],
      rows: store.products.map<DataRow>((product) {
        final textStyle = product.inStock ? TextStyle(color: Colors.black) : TextStyle(color: Colors.grey);

        return DataRow(
          cells: [
            DataCell(Text(product.code, style: textStyle)),
            DataCell(Text(product.name, style: textStyle)),
            DataCell(Text(product.specification, style: textStyle)),
            DataCell(Text('${product.price} руб.', style: textStyle)),
            DataCell(Checkbox(
              value: product.inStock,
              onChanged: (bool? value) {
                setState(() {
                  product.inStock = value ?? false;
                });
              },
            )),
            DataCell(Checkbox(
              value: product.isWatched,
              onChanged: (bool? value) {
                setState(() {
                  product.isWatched = value ?? false;
                });
              },
            )),
            DataCell(IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProductScreen(product: product),
                  ),
                );
              },
            )),
          ],
        );
      }).toList(),
    ),
  );
}


  void _handleLogout() {
    // Здесь может быть реализация выхода из аккаунта или закрытие приложения
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) =>
          LoginScreen(), // Предполагается, что такой экран есть
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products by Store'), // Название экрана
        leading: Builder(
          // Используем Builder для доступа к контексту Scaffold
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Открытие шторки
              },
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Реализация функционала поиска или открытие экрана поиска
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Меню',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Выход'),
              onTap: () {
                // Реализация выхода из приложения
                Navigator.pop(context); // Закрыть шторку
                _handleLogout(); // Метод для обработки выхода
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _updateSearchQuery,
              decoration: InputDecoration(
                hintText: "Фильтр по категориям...",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    _isOpen[index] = isExpanded;
                  });
                },
                children: stores
                    .where((store) => store.name
                        .toLowerCase()
                        .contains(_searchQuery.toLowerCase()))
                    .map<ExpansionPanel>((Store store) {
                  int index = stores.indexOf(store);
                  return ExpansionPanel(
                    canTapOnHeader: true,
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text(store.name),
                      );
                    },
                    body: _buildProductTable(store),
                    isExpanded: _isOpen[index],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
