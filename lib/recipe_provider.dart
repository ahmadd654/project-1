import 'package:flutter/material.dart';
import 'recipe.dart';

class RecipeProvider with ChangeNotifier {
  final List<Recipe> _recipes = [];

  List<Recipe> get recipes => _recipes;

  void fetchRecipes() {
    _recipes.clear();
    _recipes.addAll([
      Recipe(
        title: "Pasta Primavera",
        description: "A delightful mix of vegetables and pasta.",
        imagePath: 'assets/images/cookingbackground.jpg',  // Make sure this path is correct
        ingredients: [
          "200g pasta",
          "1 cup cherry tomatoes",
          "1/2 cup bell peppers",
          "1/4 cup olive oil",
          "Salt and pepper to taste",
        ],
      ),
      Recipe(
        title: "Chocolate Cake",
        description: "Rich and moist chocolate cake.",
        imagePath: 'assets/images/desert.png',  // Ensure this path is correct
        ingredients: [
          "2 cups flour",
          "1/2 cup cocoa powder",
          "1 cup sugar",
          "1/2 cup butter",
          "1 tsp baking soda",
        ],
      ),
      Recipe(
        title: "Vegan Salad",
        description: "Fresh greens with a light dressing.",
        imagePath: 'assets/images/Veganfood.jpg',  // Ensure this path is correct
        ingredients: [
          "2 cups lettuce",
          "1 cup cherry tomatoes",
          "1/2 cup cucumbers",
          "1/4 cup olive oil",
          "1 tbsp lemon juice",
        ],
      ),
      Recipe(
        title: "Soup Dish",
        description: "A warm and hearty soup for cold days.",
        imagePath: 'assets/images/Soupdish.jpg',  // Ensure this path is correct
        ingredients: [
          "2 cups vegetable broth",
          "1/2 cup carrots",
          "1/4 cup celery",
          "Salt and pepper to taste",
          "1 tsp garlic powder",
        ],
      ),
    ]);
    notifyListeners();
  }

  void addRecipe(Recipe recipe) {
    _recipes.add(recipe);
    notifyListeners();
  }
}
