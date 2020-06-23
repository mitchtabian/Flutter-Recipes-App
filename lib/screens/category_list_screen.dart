import 'package:flutter/material.dart';

import '../models/category.dart';
import '../styles.dart';
import '../widgets/category_list_item.dart';

class CategoryListScreen extends StatelessWidget {

  static const List<Category> Categories = const [
    Category(title:"Barbeque", imageUrl:"assets/images/barbeque.jpg"),
    Category(title:"Breakfast", imageUrl:"assets/images/breakfast.jpg"),
    Category(title:"Chicken", imageUrl:"assets/images/chicken.jpg"),
    Category(title:"Beef", imageUrl:"assets/images/beef.jpg"),
    Category(title:"Brunch", imageUrl:"assets/images/brunch.jpg"),
    Category(title:"Dinner", imageUrl:"assets/images/dinner.jpg"),
    Category(title:"Wine", imageUrl:"assets/images/wine.jpg"),
    Category(title:"Italian", imageUrl:"assets/images/italian.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Categories",
        ),
      ),
      body: GridView(
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
      ),
    );
  }
}














