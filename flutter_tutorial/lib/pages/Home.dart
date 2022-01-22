import 'package:flutter/material.dart';
import 'package:flutter_tutorial/pages/CategoryPage.dart';
import 'package:flutter_tutorial/pages/DrawerItem.dart';

class Home extends StatefulWidget{

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<Home>{
  int _selectedItem = 0;
  List<Widget> widgets = [
    Text('Home page data'),
    CategoryPage(),
  ];

  _onTabItem(itemIndex){
    setState(() {
      this._selectedItem = itemIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD App'),
      ),
      drawer: drawerItem(context),
      body: widgets.elementAt(_selectedItem),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedItem,
        onTap: _onTabItem,
        items: [
          BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              label: 'Category',
              icon: Icon(Icons.list)
          )
        ],
      ),
    );
  }

}