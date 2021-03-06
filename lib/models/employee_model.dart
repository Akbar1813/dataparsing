class Employee{
  int? id;
  String? employee_name;
  int? employee_salary;
  int? employee_age;
  String? profile_image;
  Employee({this.id, this.employee_name, this.employee_salary, this.employee_age,this.profile_image});
  Employee.Id({this.id});
  Employee.fromJson(Map<String, dynamic> json):
        id = json['id'],
        employee_name = json['employee_name'],
        employee_salary = json['employee_salary'],
        employee_age = json['employee_age'],
        profile_image = json['profile_image'];
  Map<String, dynamic> toJson() => {
    'id' : id.toString(),
    'employee_name' : employee_name,
    'employee_salary' : employee_salary.toString(),
    'employee_age' : employee_age.toString(),
    'profile_image' : profile_image
  };
}