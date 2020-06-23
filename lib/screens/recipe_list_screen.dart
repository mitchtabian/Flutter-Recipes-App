import 'package:flutter/material.dart';
import 'package:recipesapp/data/data.dart';
import 'package:recipesapp/widgets/recipe_list_item.dart';

class RecipeListScreen extends StatelessWidget {

  static const routeName = "/recipe-list";

  @override
  Widget build(BuildContext context) {

    final categoryTitle = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(
            categoryTitle
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) => RecipeListItem(
          id: recipes[index].id,
          title: recipes[index].title,
          publisher: recipes[index].publisher,
          socialRank: recipes[index].socialRank,
          imageUrl: recipes[index].imageUrl,
        ),
        itemCount: recipes.length,
      ),
    );
  }
}
















