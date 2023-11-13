class MealsModel {
  final int id;
  final String title;
  final String image;
  bool isFavorite;

  MealsModel({
    required this.id,
    required this.title,
    required this.image,
    this.isFavorite = false,
  });
}
