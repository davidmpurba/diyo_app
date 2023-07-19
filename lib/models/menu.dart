class MenuItem {
  MenuItem({required this.name, required this.price, this.quantity = 1});

  final String name;
  final double price;
  int quantity;

  void decrementQuantity() {
    if (quantity > 0) {
      quantity--;
    }
  }
}
