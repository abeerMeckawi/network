import 'dart:convert';
class Employee{

  String id;
  String name;
  String salary;
  String age;
  String image;

  Employee(this.name,this.age);

  Employee.fromJson(Map<String, dynamic>  map) :
        id = map['id']  ?? "",
        name = map['employee_name']  ?? "",
        salary = map['employee_salary']  ?? "",
        age = map['employee_age']  ?? "",
        image = map['profile_image']  ?? "";

  Map<String, dynamic> toJson() => {
    'id': id,
    'employee_name': name,
    'employee_salary': salary,
    'employee_age': age,
    'profile_image': image,
  };
}