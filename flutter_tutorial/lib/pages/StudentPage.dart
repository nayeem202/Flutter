import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/controller/StudentController.dart';
import 'package:flutter_tutorial/models/StudentModel.dart';
import 'package:flutter_tutorial/pages/DrawerItem.dart';

class Student extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return _StudentState();
  }

}

class _StudentState extends State<Student>{
  final _formKey = GlobalKey<FormState>();
  int gender = 0;
  String dropdownValue = 'System Analysis & Design';
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Registration'),
      ),
      drawer: drawerItem(context),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            TextFormField(
              controller: nameController,
              initialValue: null,
              validator: (value) => null,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            TextFormField(
              controller: mobileController,
              initialValue: null,
              decoration: InputDecoration(
                labelText: 'Mobile',
                border: OutlineInputBorder(),
              ),
            ),
            TextFormField(
              controller: emailController,
              initialValue: null,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            Expanded(child: ListTile(title: Text("Gender:"),)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    child: ListTile(
                      title: Text(
                          'Male'
                      ),
                      leading: Radio(
                        value: 0,
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = 0;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ListTile(
                      title: Text(
                          'Female'
                      ),
                      leading: Radio(
                        value: 1,
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = 1;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                children: [
                  Container(child: Text("Courses: ")),
                  Container(
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      items: <String>['System Analysis & Design', 'WPSI', '.NET'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          this.dropdownValue = value.toString();
                          print(value);
                        });
                      },
                    ),
                  )

                ],
              )
            ),
            TextFormField(
              controller: addressController,
              initialValue: null,
              keyboardType: TextInputType.multiline,
              minLines: 4,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  String name = nameController.value.toString();
                  String email = emailController.value.toString();
                  String mobile = mobileController.value.toString();
                  String address = addressController.value.toString();
                  String gen = gender == 0? 'Male': 'Female';
                  String course = this.dropdownValue;
                  var stu = StudentModel(name, email, mobile, gen, course, address);
                  var stControntroller = StudentController();
                  stControntroller.save(context, stu);
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
    )
    );
  }

}