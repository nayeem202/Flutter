



import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget{
  @override
  _CategoryPageState createState() =>_CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>{
  final _formKey = GlobalKey<FormState>();
  var catController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(20),
      children: [
        Text("Create Category", style: TextStyle(fontSize: 25.0),),
        TextFormField(
          controller: catController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Category Name'

          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ElevatedButton(
            onPressed: (){
              if(_formKey.currentState!.validate()){
                String catName = catController.value.toString();
                log(catName);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              }
            },
            child: Text('Save'),
          ),
        )
      ],
    ));
  }

}