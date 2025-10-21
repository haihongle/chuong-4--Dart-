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

void main() {
  try {
    var account = BankAccount('123456789', 1000.0);
    print(account);
    account.deposit(5000.0);
    print('Sau khi nạp 500.0 => ${account.balance.toStringAsFixed(2)}');
    account.withdraw(200.0);
    print('Sau khi rút 200.0 => ${account.balance.toStringAsFixed(2)}');

    // Thử rút vượt quá số dư để thấy ngoại lệ được ném ra
    // account.withdraw(20000.0);
    // Thử nạp số tiền âm để thấy ngoại lệ được ném ra
    // account.deposit(-100.0);
  } catch (e) {
    print('Lỗi: $e');
  }
}
