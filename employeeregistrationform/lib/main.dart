import 'package:employeeregistrationform/employeeController.dart';
import 'package:employeeregistrationform/employeemodel.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Employee Registration Form",
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: Home(),
    );
  }
}

  class Home extends StatefulWidget {
    const Home({Key? key}) : super(key: key);
  
    @override
    _HomeState createState() => _HomeState();
  }
  
  class _HomeState extends State<Home> {

    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final salaryController = TextEditingController();
    final addressController = TextEditingController();

    int gender = 0;
  final _formkey =GlobalKey<FormState>();
    String dropdownValue = 'IT';

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Employee Registration Form"),
        ),
        body: Form(
          key: _formkey,
          child: ListView(

            padding: EdgeInsets.all(20),
            children: [

              TextFormField(
                controller: nameController,
                initialValue: null,
                decoration: InputDecoration(
                  labelText: "Employee Name",

                ),
              ),

              TextFormField(
                controller: phoneController,
                initialValue: null,
                decoration: InputDecoration(
                  labelText: "Employee Phone",

                ),


              ),
              TextFormField(
                controller: salaryController,
                initialValue: null,
                decoration: InputDecoration(
                  labelText: "Employee Salary",

                ),
              ),
              Expanded(child: ListTile (title: Text("Gender"))
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: Container(
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
                      Container(child: Text("Department: ")),
                      Container(
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          items: <String>['IT', 'Production', 'Accounting', 'Marketing'].map((String value) {
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
            decoration: InputDecoration(
              labelText: "Employee Address",

            )
          ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    String name = nameController.text;
                    String phone = phoneController.text;
                    String salary = salaryController.text;
                    String address = addressController.text;
                    String gen = gender == 0? 'Male': 'Female';
                    String department = this.dropdownValue;

                    print(name);
                    var emp = EmployeeModel(name, phone, salary, gen, department, address);
                    var emController = EmployeeController();
                    emController.save(context, emp);
                  },
                  child: const Text('Submit'),
                ),
              )

            ],
          )
        ),
      );
    }
  }
  


