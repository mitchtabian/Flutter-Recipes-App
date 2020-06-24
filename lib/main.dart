import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/recipe_list_provider.dart';
import 'screens/category_list_screen.dart';
import 'screens/recipe_detail_screen.dart';
import 'screens/recipe_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context){
            return RecipeListProvider();
          },
        ),
      ],
      child: MaterialApp(
        title: 'Recipes App',
          theme: ThemeData(
              primaryColor: Colors.blue,
              accentColor: Colors.blueAccent,
              canvasColor: Color.fromRGBO(249, 249, 249, 1),
              errorColor: Colors.red,
              fontFamily: "Quicksand",
              textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                      fontFamily: "OpenSans",
                      fontSize: 21,
                      fontWeight: FontWeight.bold
                  ),
                  headline3: TextStyle(
                      color: Colors.black,
                      fontFamily: "OpenSans",
                      fontSize: 18,
                      fontWeight: FontWeight.w500
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
        home: CategoryListScreen(),
        routes: {
          RecipeListScreen.routeName: (ctx) => RecipeListScreen(),
          RecipeDetailScreen.routeName: (ctx) => RecipeDetailScreen(),
        },

      ),
    );
  }
}



















