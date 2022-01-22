class EmployeeModel{

  String name;
  String phone;
  String salary;
  String gender;
  String department;
  String address;

  EmployeeModel(this.name, this.phone, this.salary, this.gender, this.department,
      this.address);

  Map<String, dynamic> toJson() {
    return {
      'name': this.name,
      'phone': this.phone,
      'salary': this.salary,
      'gender': this.gender,
      'department': this.department,
      'address': this.address,
    };
  }



}