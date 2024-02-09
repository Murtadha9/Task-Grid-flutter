


class Product {
  Product(this.id, this.name,this.price, this.oderNo, this.qty);
  final int id;
  late  String name;
  late  String price;
  late  String oderNo;
  late  int qty;
}


final List<Product> productData = [
  Product(1, 'Product 1',  '10 ', 'ORD123', 5),
  Product(2, 'Product 2',  '20 ', 'ORD456', 10),
  Product(3, 'Product 3',  '15 ', 'ORD789', 8),
  Product(4, 'Product 1',  '10 ', 'ORD123', 5),
  Product(5, 'Product 2', '20 ', 'ORD456', 10),
  Product(6, 'Product 3',  '15 ', 'ORD789', 8),
  Product(7, 'Product 1',  '10 ', 'ORD123', 5),
  Product(8, 'Product 2',  '20 ', 'ORD456', 10),
  Product(9, 'Product 3', '15 ', 'ORD789', 8),
  Product(10, 'Product 1', '10 ', 'ORD123', 5),

];

