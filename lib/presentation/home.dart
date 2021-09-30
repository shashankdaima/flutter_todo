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
        title: Text("Todo List"),
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
      body: ListView.builder(
          itemCount: 30,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                height: 50,
                margin: const EdgeInsets.all(4),
                color: Colors.white,
                child: Material(
                  color: Colors.white.withOpacity(0.0),
                  child: InkWell(
                    child: Row(
                      children: [
                        VerticalDivider(color: Colors.blue, thickness: 4),
                        Text('First Task'),
                        Spacer(),
                        Icon(
                          Icons.priority_high_outlined,
                        ),
                      ],
                    ),
                    onTap: () {
                      print("Wow! Ripple");
                    },
                  ),
                ));
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: Text("Add Task"),
                actions: <Widget>[
                  TextFormField(
                    initialValue: '',
                    decoration: InputDecoration(
                      labelText: 'New Todo',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () => makeToast("CANCELLED"),
                          child: Text("CANCEL")),
                      TextButton(
                          onPressed: () => makeToast("OK"),
                          child: Text("OKAY")),
                    ],
                    mainAxisAlignment: MainAxisAlignment.end,
                  )
                ],
              ),
            );
          },
          child: const Icon(Icons.add)),
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
      msg: s,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      fontSize: 16.0);
}
