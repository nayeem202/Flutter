import 'package:flutter/material.dart';

void main() {
  runApp(countApp());
}

class countApp extends StatelessWidget {
   countApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Count App",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
  home: MyHomePage(title : "Counter App"),

    );
  }
}


class MyHomePage extends StatefulWidget {
  var title;

   MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter(){
    setState(() {
        _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ("Counter App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
Text('Count'), Text(
              '$_counter', style: Theme.of(context).textTheme.headline4,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes

    );
  }
}

