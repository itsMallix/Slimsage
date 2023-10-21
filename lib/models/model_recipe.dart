class Recipe {
  final String spoonacularSoucreUrl;

  Recipe({required this.spoonacularSoucreUrl});

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(spoonacularSoucreUrl: map['spoonacularSourceUrl']);
  }
}
