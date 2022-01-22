


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showSuccessMessage(BuildContext context, {message:  'Data submitted successfully'}){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}

showErrorMessage(BuildContext context, {message:  'Data submitted failed!, please try again..'}){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}