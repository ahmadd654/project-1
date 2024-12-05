class Recipe {
  final String title;
  final String description;
  final String imagePath; // Changed to non-nullable
  final List<String> ingredients;

  Recipe({
    required this.title,
    required this.description,
    required this.imagePath, // No longer nullable
    required this.ingredients,
  });
}
