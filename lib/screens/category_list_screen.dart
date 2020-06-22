import 'package:flutter/material.dart';

import '../data/data.dart';
import '../models/category.dart';
import '../styles.dart';
import '../widgets/category_list_item.dart';

class CategoryListScreen extends StatelessWidget {

  final List<Category> _categories;

  CategoryListScreen(this._categories);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(DefaultCardPadding),
      children: <Widget>[
        ...Categories.map((categoryData) => CategoryListItem(
          categoryData.title,
          categoryData.imageUrl
        )).toList(),
      ],
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 4/3
      ),
    );
  }
}














