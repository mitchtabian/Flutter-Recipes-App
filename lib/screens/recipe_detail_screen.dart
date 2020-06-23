import 'package:flutter/material.dart';
import 'package:recipesapp/styles.dart';
import 'package:recipesapp/widgets/image_banner.dart';

import '../models/recipe.dart';

class RecipeDetailScreen extends StatelessWidget {

  static const routeName = "/recipe-detail";

  @override
  Widget build(BuildContext context) {

    final recipeId = ModalRoute.of(context).settings.arguments as String;

    final Recipe _recipe = Recipe(
        id: DateTime.now().toString(),
        title: "Red Wine-Braised Shortribs", publisher: "Mitch's Recipes",
        imageUrl: "assets/images/wine.jpg",
        socialRank: 99.842,
        ingredients: [
          "5 pound bone-in beef short ribs, cut crosswise into 2\" pieces",
          "Kosher salt and freshly ground black pepper",
          "3 tablespoons vegetable oil",
          "3 medium onions, chopped",
          "3 medium carrots, peeled, chopped",
          "2 celery stalks, chopped",
          "3 tablespoons all-purpose flour",
          "1 tablespoon tomato paste",
          "1 750ml bottle dry red win (preferably Cabernet Sauvignon)",
          "10 sprigs flat leaf parsley",
          "8 sprigs oregano",
          "4 cups low salt beef stock"
        ],
        timestamp: DateTime.now()
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _recipe.title,
          softWrap: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ImageBanner(
              assetPath: _recipe.imageUrl,
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
















