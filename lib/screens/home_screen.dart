import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../recipe_provider.dart';
import '../recipe.dart';
import 'recipe_details.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final recipeProvider = Provider.of<RecipeProvider>(context);

    // Fetch recipes when the screen is built
    recipeProvider.fetchRecipes();

    return Scaffold(
      appBar: AppBar(
        title: Text("Recipe List"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade100, Colors.purple.shade50],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: recipeProvider.recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipeProvider.recipes[index];
            return GestureDetector(
              onTap: () {
                // Navigate to the recipe details page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeDetails(recipe: recipe),
                  ),
                );
              },
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      recipe.imagePath, // This should not be null anymore
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    recipe.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(recipe.description),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          recipeProvider.addRecipe(
            Recipe(
              title: "New Recipe ${recipeProvider.recipes.length + 1}",
              description: "A delicious new recipe.",
              imagePath: 'assets/images/Veganfood.jpg', // Default image
              ingredients: ["Ingredients go here"],
            ),
          );
        },
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add),
      ),
    );
  }
}
