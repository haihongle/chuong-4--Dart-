abstract class Item {
  String name;
  double price;

  Item(this.name, this.price) {
    if (price <= 0) throw Exception('Giá phải lớn hơn 0');
  }

  double taxRate(); 
  double taxAmount() => price * taxRate();
  double totalPrice() => price + taxAmount();

  String getDetails();
}

class Electronics extends Item {
  Electronics(String name, double price) : super(name, price);

  @override
  double taxRate() => 0.10; // 10%

  @override
  String getDetails() => '$name (Electronics), Giá: ${price.toStringAsFixed(2)}, Thuế: ${taxAmount().toStringAsFixed(2)}';
}

class Clothing extends Item {
  Clothing(String name, double price) : super(name, price);

  @override
  double taxRate() => 0.10; // 10%

  @override
  String getDetails() => '$name (Clothing), Giá: ${price.toStringAsFixed(2)}, Thuế: ${taxAmount().toStringAsFixed(2)}';
}

class Warehouse {
  final List<Item> _items = [];

  void addItem(Item item) => _items.add(item);

  double totalValueBeforeTax() => _items.fold(0.0, (s, i) => s + i.price);
  double totalTax() => _items.fold(0.0, (s, i) => s + i.taxAmount());
  double totalValueAfterTax() => totalValueBeforeTax() + totalTax();

  List<Item> get items => List.unmodifiable(_items);
}

void main() {
  var w = Warehouse();
  w.addItem(Electronics('Smartphone', 1000.0));
  w.addItem(Electronics('Laptop', 2000.0));
  w.addItem(Clothing('Áo phông', 20.0));
  w.addItem(Clothing('Quần jeans', 50.0));

  print('Danh sách hàng trong kho:');
  for (var it in w.items) {
    print(it.getDetails());
  }

  print('\nTổng giá trị trước thuế: ${w.totalValueBeforeTax().toStringAsFixed(2)}');
  print('Tổng thuế (10%): ${w.totalTax().toStringAsFixed(2)}');
  print('Tổng giá trị sau thuế: ${w.totalValueAfterTax().toStringAsFixed(2)}');
}
