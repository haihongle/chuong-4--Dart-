class Book {
  String _title;
  String _author;
  double _price;
  String _category;

  static final List<String> _validCategories = ['Văn học', 'Khoa học', 'Kỹ thuật'];

  Book(this._title, this._author, this._price, this._category) {
    if (_price <= 0) throw Exception('Giá không hợp lệ');
    if (!_validCategories.contains(_category)) {
      throw Exception('Thể loại không hợp lệ: $_category');
    }
  }

  String get title => _title;
  String get author => _author;
  double get price => _price;
  String get category => _category;

  set price(double value) {
    if (value <= 0) throw Exception('Giá không hợp lệ');
    _price = value;
  }

  String getDetails() => '$_title: $_author, $_category, Giá: ${_price.toStringAsFixed(2)}';
}

class Library {
  final List<Book> _books = [];

  void addBook(Book book) {
    _books.add(book);
  }

  void removeBook(String title) {
    _books.removeWhere((b) => b.title == title);
  }

  List<Book> findBooksByCategory(String category) {
    return _books.where((b) => b.category == category).toList();
  }

  double calculateTotalValue() {
    return _books.fold(0.0, (sum, b) => sum + b.price);
  }

  List<Book> get books => List.unmodifiable(_books);
}

void main() {
  var library = Library();

  try {
    // Thêm sách
    library.addBook(Book('Sách Văn học', 'Nguyễn Du', 25.0, 'Văn học'));
    library.addBook(Book('Sách Khoa học', 'Einstein', 50.0, 'Khoa học'));
    library.addBook(Book('Sách Kỹ thuật', 'Tesla', 75.0, 'Kỹ thuật'));
    library.addBook(Book('Sách Toán', 'Gauss', 40.0, 'Khoa học'));
    library.addBook(Book('Sách Văn', 'Tố Hữu', 30.0, 'Văn học'));

    // Xóa sách
    library.removeBook('Sách Văn');

    // Tìm sách theo thể loại
    var scienceBooks = library.findBooksByCategory('Khoa học');

    // In kết quả
    print('Danh sách sách:');
    for (var b in library.books) {
      print(b.getDetails());
    }
    print('Tổng giá trị: ${library.calculateTotalValue().toStringAsFixed(2)}');

    print('\nSách theo thể loại Khoa học:');
    for (var b in scienceBooks) {
      print('${b.title}: ${b.author}, Giá: ${b.price.toStringAsFixed(2)}');
    }
  } catch (e) {
    print('Lỗi: $e');
  }
}
