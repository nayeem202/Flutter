


import 'dart:convert';
import 'dart:developer';

import 'package:employeeregistrationform/customDialg.dart';
import 'package:employeeregistrationform/employeemodel.dart';
import 'package:employeeregistrationform/http_helper.dart';
import 'package:flutter/cupertino.dart';

class EmployeeController{
  var url = Uri.parse('http://localhost:9092/');

  Future<dynamic> save(BuildContext context, EmployeeModel employee) async{
    try{
      var jsonData = jsonEncode(employee.toJson());
      var res = await postData(url, jsonData);
      if(res.statusCode == 200){
        showSuccessMessage(context);

      }else{
        showErrorMessage(context, message: 'employee form submitted failed');
      }

      return res;
    }catch(e){
      log(e.toString());


    }
  }
}