import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}
final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100];


class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List "),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.sort_outlined,
            ),
            onPressed: () {
              makeToast("Sort Clicked");
            },
          ),
          PopupMenuButton<String>(
            onSelected: (item) => handleClick(item),
            itemBuilder: (context) => [
              PopupMenuItem<String>(value: "0", child: Text('Logout')),
              PopupMenuItem<String>(value: "1", child: Text('Settings')),
            ],
          ),
        ],
      ),
      body:ListView.builder(
          itemCount: entries.length,padding:const EdgeInsets.all(8),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.amber[colorCodes[index]],
              child: Center(child: Text('Entry ${entries[index]}')),
            );
          }

      )
      ,
      floatingActionButton: FloatingActionButton(onPressed: () {  },
          child: const Icon(Icons.add)
      ),
    );
  }

  void handleClick(String value) {
    switch (value) {
      case '0':
        makeToast("Logout Clicked");

        break;
      case '1':
        makeToast("Settings Clicked");
        break;
    }
  }
}

void makeToast(String s) {
  Fluttertoast.showToast(
      msg:s,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      fontSize: 16.0);
}
