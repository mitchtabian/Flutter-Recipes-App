import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/recipe.dart';
import '../util/constants.dart';

class RecipeListProvider with ChangeNotifier{

  List<Recipe> _recipes = [];

  String _query = "";
  String _page = "1";
  static const String _key = "";

  setQuery(String q){
    _query = q;
  }

  setPage(String page){
    _page = page;
  }

  List<Recipe> get getRecipes {
    return [..._recipes];
  }

  String get getQuery{
    return _query;
  }

  Future<void> searchAndSetRecipes() async {
    String url = Constants.SEARCH_URL + "?key=$_key&q=$_query&page=$_page";
    try{
      final response = await http.get(url,);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      print(extractedData);
      extractedData.forEach((key, value) {
        if(key == "recipes"){
          var recipesList = value as List<dynamic>;
          _recipes.clear();
          recipesList.forEach((element) {
            _recipes.add(
              Recipe(
                recipe_id: element['recipe_id'],
                title: element['title'],
                publisher: element['publisher'],
                image_url: element['image_url'],
                social_rank: element['social_rank'].toString(),
                ingredients: element['ingredients'],
                timestamp: element['timestamp'],
              )
            );
          });
          notifyListeners();
        }
      });
    }catch(error){
      throw error;
    }
  }
}















