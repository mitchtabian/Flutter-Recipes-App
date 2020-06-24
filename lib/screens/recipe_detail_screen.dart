import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/recipe_provider.dart';
import '../styles.dart';
import '../models/recipe.dart';

class RecipeDetailScreen extends StatefulWidget {

  static const routeName = "/recipe-detail";

  @override
  _RecipeDetailScreenState createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {

  Recipe _recipe;
  var _isLoading = false;
  var _isInit = false;

  _setIsLoading(bool isLoading){
    setState(() {
      _isLoading = isLoading;
    });
  }

  @override
  void didChangeDependencies() {
    if(!_isInit){
      _setIsLoading(true);
      Provider.of<RecipeProvider>(context, listen: false)
          .searchAndSetRecipe()
          .then((value) {
            _setIsLoading(false);
            _recipe = Provider.of<RecipeProvider>(context, listen: false).getRecipe;
            print("recipe: ${_recipe}");
        })
        .catchError((error){
          _setIsLoading(false);
          return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text("Error"),
              content: Text("Something went wrong getting the data from the server."),
              actions: <Widget>[
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ).then((value) {
            Navigator.of(context).pop();
          });
        });
      _isInit = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isLoading ? "Loading..." : _recipe.title,
          softWrap: true,
        ),
      ),
      body: _isLoading ?
      Center(
        child: CircularProgressIndicator(),
      ):
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.network(
              _recipe.image_url,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Column(
              children: <Widget>[
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      horizontal: DefaultPadding,
                      vertical: 20
                  ),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _recipe.title,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Text(
                        _recipe.publisher,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: 300,
              child: ListView.builder(
                itemBuilder: (ctx, index) => Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: DefaultPadding,
                    vertical: 5,
                  ),
                  child: Text(
                      _recipe.ingredients[index],
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                ),
                itemCount: _recipe.ingredients.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
















