import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/recipe.dart';
import '../util/constants.dart';

class RecipeProvider with ChangeNotifier{

  String _recipeId;
  Recipe _recipe;
  String _key = "";

  Recipe get getRecipe{
    return _recipe;
  }

  String get getRecipeId{
    return _recipeId;
  }

  setRecipe(Recipe recipe){
    _recipe = recipe;
  }

  setRecipeId(String id){
    _recipeId = id;
  }

  Future<void> searchAndSetRecipe() async {
    String url = Constants.GET_RECIPE_URL + "?key=$_key&rId=$_recipeId";
    try{
      final response = await http.get(url,);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      extractedData.forEach((key, value) {
        if(key == "recipe"){
          List<String> ingredients = [];
          (value['ingredients'] as List<dynamic>).forEach((element) {
            ingredients.add(element.toString());
          });
          _recipe = Recipe(
            recipe_id: value['recipe_id'],
            title: value['title'],
            publisher: value['publisher'],
            image_url: value['image_url'],
            social_rank: value['social_rank'].toString(),
            ingredients: ingredients,
            timestamp: value['timestamp'],
          );
          notifyListeners();
        }
      });
    }catch(error){
      throw error;
    }
  }
}
















