import 'package:flutter/material.dart';
import 'package:recipesapp/styles.dart';
import 'package:recipesapp/widgets/image_banner.dart';

import '../models/recipe.dart';

class RecipeDetailScreen extends StatelessWidget {

  static const routeName = "/recipe-detail";

  @override
  Widget build(BuildContext context) {

    final recipeId = ModalRoute.of(context).settings.arguments as String;

    final Recipe _recipe = null;

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
              assetPath: _recipe.image_url,
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
















