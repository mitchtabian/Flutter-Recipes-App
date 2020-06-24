import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/recipe_list_provider.dart';
import '../widgets/recipe_list_item.dart';
import '../models/recipe.dart';

class RecipeListScreen extends StatefulWidget {

  static const routeName = "/recipe-list";

  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {

  var _isInit = false;
  var _isLoading = false;
  List<Recipe> _recipes = [];
  String query = "";

  @override
  void didChangeDependencies() {
    if(!_isInit){
      _setIsLoading(true);
      query = Provider.of<RecipeListProvider>(context, listen: false).getQuery;
      Provider.of<RecipeListProvider>(context, listen: false)
          .searchAndSetRecipes()
          .then((value) {
            _setIsLoading(false);
            _recipes = Provider.of<RecipeListProvider>(context, listen: false).getRecipes;
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
    }
  }

  _setIsLoading(bool isLoading){
    setState(() {
      _isLoading = isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
            query
        ),
      ),
      body: _isLoading ?
      Center(
        child: CircularProgressIndicator(),
      ):
      ListView.builder(
        itemBuilder: (ctx, index) => RecipeListItem(
          id: _recipes[index].recipe_id,
          title: _recipes[index].title,
          publisher: _recipes[index].publisher,
          socialRank: _recipes[index].social_rank,
          imageUrl: _recipes[index].image_url,
        ),
        itemCount: _recipes.length,
      ),
    );
  }


}
















