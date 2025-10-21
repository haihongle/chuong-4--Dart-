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

  double calculateArea() => _length * _width;
  double calculatePerimeter() => 2 * (_length + _width);

  @override
  String toString() =>
      'Chiều dài ${_length.toStringAsFixed(2)}, Chiều rộng ${_width.toStringAsFixed(2)}';
}

void main() {
  try {
    var rect = Rectangle(5.0, 3.0);
    var square = Rectangle.square(4.0);

    print('Hình chữ nhật: ${rect.toString()}');
    print('Chu vi: ${rect.calculatePerimeter().toStringAsFixed(2)}, Diện tích: ${rect.calculateArea().toStringAsFixed(2)}');
    print('---');
    print('Hình vuông: ${square.toString()}');
    print('Chu vi: ${square.calculatePerimeter().toStringAsFixed(2)}, Diện tích: ${square.calculateArea().toStringAsFixed(2)}');
  } catch (e) {
    print('Lỗi: $e');
  }
}
