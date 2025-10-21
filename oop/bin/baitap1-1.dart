class student {
  String name ;
  int age ;
  double grade ;

  student(this.name, this.age, this.grade);
  
  String getGrade(){
    if(grade >= 8.5){
      return "Giỏi";
    }
    if(grade >= 7.0){
      return "Khá";
    }
    if(grade >= 5.0){
      return "Trung bình";
    }
    return "Yếu";
  }
}

void main(){
  List<student> students = [
    student("An", 20, 9.0),
    student("Bình", 21, 6.5),
    student("Cường", 22, 4.0),
  ];

  for(var s in students){
    print("Tên: ${s.name}, Tuổi: ${s.age}, Điểm: ${s.grade}, Xếp loại: ${s.getGrade()}");
  }
}