import 'package:flutter/material.dart';
import 'package:recipesapp/screens/category_list_screen.dart';

import 'data/data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipes App',
        theme: ThemeData(
          primaryColor: Colors.white,
            accentColor: Colors.blue,
            canvasColor: Color.fromRGBO(249, 249, 249, 1),
            errorColor: Colors.red,
            fontFamily: "Quicksand",
            textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                    fontFamily: "OpenSans",
                    fontSize: 21,
                    fontWeight: FontWeight.bold
                ),
                bodyText1: TextStyle(
                    color: Color.fromRGBO(20, 51, 51, 1)
                ),
                bodyText2: TextStyle(
                    color: Color.fromRGBO(20, 51, 51, 1)
                ),
                button: TextStyle(
                    color: Colors.white
                )
            ),
            appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: "OpenSans",
                  fontSize: 20,
                ),
              ),
            )
        ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Recipes App"),
      ),
      body: CategoryListScreen(Categories),
    );
  }
}


















