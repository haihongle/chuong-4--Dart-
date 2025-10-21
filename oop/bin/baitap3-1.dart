class Person {
  String name;
  int age;

  Person(this.name, this.age);

  void introduce() => print('Tôi là $name, $age tuổi');
}

class Student extends Person {
  double grade;

  Student(String name, int age, this.grade) : super(name, age);

  @override
  void introduce() => print('Sinh viên: $name, $age tuổi, Điểm: ${grade.toStringAsFixed(2)}');
}

class Teacher extends Person {
  String subject;

  Teacher(String name, int age, this.subject) : super(name, age);

  @override
  void introduce() => print('Giáo viên: $name, $age tuổi, Môn dạy: $subject');
}

void main() {
  List<Person> people = [
    Student('An', 20, 8.5),
    Student('Bình', 21, 7.0),
    Teacher('Cường', 35, 'Toán'),
  ];

  for (var p in people) {
    p.introduce();
  }
}
