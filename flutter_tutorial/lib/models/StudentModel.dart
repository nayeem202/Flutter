

class StudentModel{

  String name;
  String email;
  String mobile;
  String gender;
  String course;
  String address;

  StudentModel(this.name, this.email, this.mobile, this.gender, this.course,
      this.address);

  Map<String, dynamic> toJson() {
    return {
      'name': this.name,
      'email': this.email,
      'mobile': this.mobile,
      'gender': this.gender,
      'course': this.course,
      'address': this.address,
    };
  }



}