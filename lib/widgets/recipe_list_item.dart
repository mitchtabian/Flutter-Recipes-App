import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:recipesapp/screens/recipe_detail_screen.dart';

import '../styles.dart';


class RecipeListItem extends StatelessWidget {

  final String id;
  final String title;
  final String publisher;
  final String socialRank;
  final String imageUrl;

  RecipeListItem({
    @required this.id,
    @required this.title,
    @required this.publisher,
    @required this.socialRank,
    @required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
            RecipeDetailScreen.routeName,
            arguments: id
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RoundedCardRadius),
        ),
        elevation: DefaultCardElevation,
        margin: EdgeInsets.all(DefaultCardMargin),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(RoundedCardRadius),
                    topRight: Radius.circular(RoundedCardRadius),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(DefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline3,
                    textAlign: TextAlign.start,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        publisher,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16
                        ),
                      ),
                      Text(
                        "${double.parse(socialRank).toStringAsFixed(0)}",
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontSize: 15
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}





























