import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation/my_header_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  var currentPage = DrawerSections.dashboard;
  final tabs = [
    Center(child: Text("Search")),
    Center(child: Text("Home")),
    Center(child: Text("Camera")),
    Center(child: Text("Profile")),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,

          items: [
            BottomNavigationBarItem(
              icon : Icon(Icons.search),
              title: Text('Search'),
              backgroundColor: Colors.blue
            ),
            BottomNavigationBarItem(
                icon : Icon(Icons.home),
                title: Text('Home'),
                backgroundColor: Colors.red
            ),
            BottomNavigationBarItem(
                icon : Icon(Icons.camera),
                title: Text('camera'),
                backgroundColor: Colors.green
            ),
            BottomNavigationBarItem(
                icon : Icon(Icons.person),
                title: Text('Profile'),
                backgroundColor: Colors.deepOrange
            ),
          ],
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );

  }



  Widget MyDrawerList(){
    return Container(
      padding: EdgeInsets.only(top: 15,),
      child: Column(
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, "Contacts", Icons.people_alt_outlined,
              currentPage == DrawerSections.contacts ? true : false),
          menuItem(3, "Events", Icons.event,
              currentPage == DrawerSections.events ? true : false),
          menuItem(4, "Notes", Icons.notes,
              currentPage == DrawerSections.notes ? true : false),

        ],
      ),
    );
  }





  Widget menuItem(int id, String title, IconData icon, bool selected){

    return Material(
        color: selected ? Colors.grey[300] : Colors.transparent,
        child: InkWell(
          onTap: (){
            Navigator.pop(context);
            setState(() {
              if (id == 1) {
                currentPage = DrawerSections.dashboard;
              } else if (id == 2) {
                currentPage = DrawerSections.contacts;
              } else if (id == 3) {
                currentPage = DrawerSections.events;
              } else if (id == 4) {
                currentPage = DrawerSections.notes;
              }
            });
          },

          child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: [

                  Expanded(
                    child: Icon(icon,
                      size: 20,
                      color: Colors.black,),
                  ),
                  Expanded(
                      flex: 3,
                      child: Text(
                        title,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16
                        ),
                      )

                  )
                ],
              )
          ),
        )
    );
  }

}




      enum DrawerSections {
      dashboard,
      contacts,
      events,
      notes,

      }