class Store {
  final String name;
  final List<Product> products;

  Store({required this.name, required this.products});
}

class Product {
  final String code;
  final String name;
  final String specification;
  double price;
  bool inStock;
  bool isWatched;

  Product({
    required this.code,
    required this.name,
    required this.specification,
    required this.price,
    this.inStock = true,
    this.isWatched = false,
  });
}

// Расширенный список магазинов и товаров
final List<Store> stores = [
  Store(
    name: "Электроника Сити",
    products: [
      Product(code: "E1001", name: "Телевизор", specification: "42 дюйма LED", price: 22000.0, inStock: true),
      Product(code: "E1002", name: "Холодильник", specification: "500 л No Frost", price: 45000.0, inStock: true),
      Product(code: "E1003", name: "Микроволновка", specification: "800W", price: 8500.0, inStock: false),
    ],
  ),
  Store(
    name: "Компьютерный Мир",
    products: [
      Product(code: "C2001", name: "Ноутбук", specification: "Intel i5/8GB/256GB SSD", price: 55000.0, inStock: false),
      Product(code: "C2002", name: "Монитор", specification: "27 дюймов 4K", price: 33000.0, inStock: true),
      Product(code: "C2003", name: "Игровая мышь", specification: "7200 DPI", price: 1200.0, inStock: true),
    ],
  ),
  Store(
    name: "Мир Мебели",
    products: [
      Product(code: "F3001", name: "Диван", specification: "Кожаный", price: 102000.0, inStock: true),
      Product(code: "F3002", name: "Кресло", specification: "Тканевое", price: 55000.0, inStock: false),
    ],
  ),
  Store(
    name: "Одежда и Стиль",
    products: [
      Product(code: "A4001", name: "Платье", specification: "Вечернее", price: 7500.0, inStock: true),
      Product(code: "A4002", name: "Куртка", specification: "Зимняя", price: 15000.0, inStock: true),
      Product(code: "A4003", name: "Джинсы", specification: "Slim Fit", price: 4200.0, inStock: true),
    ],
  ),
  // Добавьте дополнительные магазины и товары по необходимости
];
