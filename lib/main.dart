import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Drawer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Raleway_Bold',
      ),
      home: MyHomePage(title: "My Home Page"),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String fontTitle = "Select";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text("Drawer Header"),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text("Item 1"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Item 2"),
              onTap: () {
                Navigator.pop(context);
              }
            )
          ],
        ),
      ),
      body: Center(

        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                showSnackbar("Yay!! Snackbar...");
              },
              child: Text('Show SnackBar'),
            ),
            Text("This is your selected font style...", style: TextStyle(fontFamily: 'SanFrancisco', fontSize: 24.0, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: RaisedButton(onPressed: () {
                    setState(() {
                      fontTitle = "RobotoMono";
                    });
                  }, child: Text("RobotoMono Font"),),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: RaisedButton(onPressed: () {
                    setState(() {
                      fontTitle = "Raleway";
                    });
                  }, child: Text("Raleway Font"),),
                )
              ],
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        )
      ),
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
            icon: Icon(Icons.weekend_rounded),
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            }
        ),
      ),
    );
  }

  void showSnackbar(String titleSnackbar){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(
            content: Text(
              titleSnackbar,
              style: TextStyle(
                fontFamily: "SanFrancisco",
                fontStyle: FontStyle.italic,
              ),
            ),
          action: SnackBarAction(
            label: "Undo",
            onPressed: () {

            },
          ),
        ),
    );
  }
}
