import 'dart:io';

// =============================
// Bài 1: Quản lý sinh viên
// =============================
class Student {
  String name;
  int age;
  double grade;

  Student(this.name, this.age, this.grade);

  String getGrade() {
    if (grade >= 8.5) return 'Giỏi';
    if (grade >= 7.0) return 'Khá';
    if (grade >= 5.0) return 'Trung bình';
    return 'Yếu';
  }

  @override
  String toString() =>
      'Sinh viên: $name, Tuổi: $age, Điểm: ${grade.toStringAsFixed(2)}';
}

void bai1() {
  print('=== BÀI 1: QUẢN LÝ SINH VIÊN ===');
  List<Student> students = [
    Student('An', 20, 8.7),
    Student('Bình', 21, 7.2),
    Student('Cường', 19, 4.5),
  ];

  for (var s in students) {
    print(s.toString());
    print('Xếp loại: ${s.getGrade()}');
    print('---');
  }
}

// =============================
// Bài 2: Hình chữ nhật
// =============================
class Rectangle {
  double _length;
  double _width;

  Rectangle(this._length, this._width) {
    if (_length <= 0 || _width <= 0) {
      throw Exception('Kích thước không hợp lệ');
    }
  }

  Rectangle.square(double size)
      : _length = size,
        _width = size {
    if (size <= 0) throw Exception('Kích thước không hợp lệ');
  }

  double get length => _length;
  double get width => _width;

  set length(double value) {
    if (value <= 0) throw Exception('Chiều dài không hợp lệ');
    _length = value;
  }

  set width(double value) {
    if (value <= 0) throw Exception('Chiều rộng không hợp lệ');
    _width = value;
  }

  double area() => _length * _width;
  double perimeter() => 2 * (_length + _width);

  @override
  String toString() =>
      'Chiều dài ${_length.toStringAsFixed(2)}, Chiều rộng ${_width.toStringAsFixed(2)}';
}

void bai2() {
  print('=== BÀI 2: HÌNH CHỮ NHẬT ===');
  var rect = Rectangle(5.0, 3.0);
  var square = Rectangle.square(4.0);
  print('Hình chữ nhật: $rect');
  print(
      'Chu vi: ${rect.perimeter()}, Diện tích: ${rect.area()}');
  print('---');
  print('Hình vuông: $square');
  print(
      'Chu vi: ${square.perimeter()}, Diện tích: ${square.area()}');
}

// =============================
// Bài 3: Tài khoản ngân hàng
// =============================
class BankAccount {
  String _accountNumber;
  double _balance;

  BankAccount(this._accountNumber, this._balance) {
    if (_balance < 0) throw Exception('Số dư ban đầu không hợp lệ');
  }

  String get accountNumber => _accountNumber;
  double get balance => _balance;

  void deposit(double amount) {
    if (amount <= 0) throw Exception('Số tiền nạp không hợp lệ');
    _balance += amount;
  }

  void withdraw(double amount) {
    if (amount <= 0) throw Exception('Số tiền rút không hợp lệ');
    if (_balance < amount) throw Exception('Số dư không đủ');
    _balance -= amount;
  }

  @override
  String toString() => 'Tài khoản: $_accountNumber, Số dư: ${_balance.toStringAsFixed(2)}';
}

void bai3() {
  print('=== BÀI 3: TÀI KHOẢN NGÂN HÀNG ===');
  var account = BankAccount('123456789', 1000.0);
  print(account);
  account.deposit(500);
  print('Sau khi nạp 500 => ${account.balance}');
  account.withdraw(200);
  print('Sau khi rút 200 => ${account.balance}');
}

// =============================
// Bài 4: Kế thừa Person/Student/Teacher
// =============================
class Person {
  String name;
  int age;
  Person(this.name, this.age);

  void introduce() => print('Tôi là $name, $age tuổi');
}

class Student2 extends Person {
  double grade;
  Student2(String name, int age, this.grade) : super(name, age);
  @override
  void introduce() =>
      print('Sinh viên: $name, $age tuổi, Điểm: ${grade.toStringAsFixed(2)}');
}

class Teacher extends Person {
  String subject;
  Teacher(String name, int age, this.subject) : super(name, age);
  @override
  void introduce() =>
      print('Giáo viên: $name, $age tuổi, Môn: $subject');
}

void bai4() {
  print('=== BÀI 4: KẾ THỪA ===');
  List<Person> people = [
    Student2('An', 20, 8.5),
    Student2('Bình', 21, 7.0),
    Teacher('Cường', 35, 'Toán'),
  ];
  for (var p in people) {
    p.introduce();
  }
}

// =============================
// Bài 5: Quản lý thư viện
// =============================
class Book {
  String title;
  String author;
  double price;
  String category;

  Book(this.title, this.author, this.price, this.category);

  String getDetails() =>
      '$title - $author - $category - ${price.toStringAsFixed(2)}';
}

class Library {
  final List<Book> _books = [];
  void addBook(Book b) => _books.add(b);
  void removeBook(String title) =>
      _books.removeWhere((b) => b.title == title);
  List<Book> findByCategory(String cat) =>
      _books.where((b) => b.category == cat).toList();
  double totalValue() =>
      _books.fold(0.0, (sum, b) => sum + b.price);
  List<Book> get books => List.unmodifiable(_books);
}

void bai5() {
  print('=== BÀI 5: QUẢN LÝ THƯ VIỆN ===');
  var lib = Library();
  lib.addBook(Book('Văn học 1', 'Nguyễn Du', 25, 'Văn học'));
  lib.addBook(Book('Khoa học 1', 'Einstein', 50, 'Khoa học'));
  lib.addBook(Book('Kỹ thuật 1', 'Tesla', 75, 'Kỹ thuật'));
  print('Danh sách sách:');
  for (var b in lib.books) {
    print(b.getDetails());
  }
  print('Tổng giá trị: ${lib.totalValue()}');
}

// =============================
// Bài 6: Kho hàng (Item/Electronics/Clothing)
// =============================
abstract class Item {
  String name;
  double price;
  Item(this.name, this.price);
  double taxRate();
  double total() => price + price * taxRate();
  String getDetails();
}

class Electronics extends Item {
  Electronics(String name, double price) : super(name, price);
  @override
  double taxRate() => 0.1;
  @override
  String getDetails() =>
      '$name (Electronics): Giá ${price.toStringAsFixed(2)}, Tổng ${total().toStringAsFixed(2)}';
}

class Clothing extends Item {
  Clothing(String name, double price) : super(name, price);
  @override
  double taxRate() => 0.1;
  @override
  String getDetails() =>
      '$name (Clothing): Giá ${price.toStringAsFixed(2)}, Tổng ${total().toStringAsFixed(2)}';
}

class Warehouse {
  final List<Item> _items = [];
  void addItem(Item item) => _items.add(item);
  double totalBeforeTax() => _items.fold(0, (s, i) => s + i.price);
  double totalAfterTax() => _items.fold(0, (s, i) => s + i.total());
  List<Item> get items => List.unmodifiable(_items);
}

void bai6() {
  print('=== BÀI 6: KHO HÀNG ===');
  var w = Warehouse();
  w.addItem(Electronics('Smartphone', 1000));
  w.addItem(Electronics('Laptop', 2000));
  w.addItem(Clothing('Áo phông', 20));
  w.addItem(Clothing('Quần jeans', 50));

  for (var i in w.items) {
    print(i.getDetails());
  }
  print('Tổng giá trị trước thuế: ${w.totalBeforeTax()}');
  print('Tổng giá trị sau thuế: ${w.totalAfterTax()}');
}

// =============================
// MENU CHÍNH
// =============================
void main() {
  while (true) {
    print('\n=== CHƯƠNG 4: LẬP TRÌNH HƯỚNG ĐỐI TƯỢNG CƠ BẢN ===');
    print('1. Quản lý sinh viên');
    print('2. Hình chữ nhật');
    print('3. Tài khoản ngân hàng');
    print('4. Kế thừa (Person/Student/Teacher)');
    print('5. Quản lý thư viện');
    print('6. Kho hàng');
    print('0. Thoát');
    stdout.write('Chọn bài (0-6): ');
    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        bai1();
        break;
      case '2':
        bai2();
        break;
      case '3':
        bai3();
        break;
      case '4':
        bai4();
        break;
      case '5':
        bai5();
        break;
      case '6':
        bai6();
        break;
      case '0':
        print('Tạm biệt!');
        return;
      default:
        print('Lựa chọn không hợp lệ.');
    }
  }
}
