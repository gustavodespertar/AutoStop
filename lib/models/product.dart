class Product {
  final String category;
  final String name;
  final double price;
  final String description;
  final String imagepath;
 int quantity;
 double totalPrice;
  Product(
      {
      required this.category,
      required this.name,
      required this.price,
      required this.description,
      required this.imagepath,
      this.quantity = 0,
      this.totalPrice = 0});

  //incremento de quantidade
  void incrementQuantity() {
    quantity++;
    totalPrice += price;
  }
  //decremento de quantidade
  void decreamentQuantity() {
    quantity--;
    totalPrice -= price;
  }

  //quantidade inicial
  void initialQuantity() {
    quantity = 0;
    totalPrice = 0;
  }
}
