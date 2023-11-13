class MealDetailModel {
  final int id;
  final String title;
  final String image;
  final int servings;
  final int readyInMinutes;
  final String license;
  final String sourceName;
  final String sourceUrl;
  final String spoonacularSourceUrl;
  final double spoonacularScore;
  final double pricePerServing;
  final List<String> dishTypes;
  final List<ExtendedIngredient> extendedIngredients;
  final String summary;

  MealDetailModel({
    required this.id,
    required this.title,
    required this.image,
    required this.servings,
    required this.readyInMinutes,
    required this.license,
    required this.sourceName,
    required this.sourceUrl,
    required this.spoonacularSourceUrl,
    required this.spoonacularScore,
    required this.pricePerServing,
    required this.dishTypes,
    required this.extendedIngredients,
    required this.summary,
  });

  factory MealDetailModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> extendedIngredientsList = json['extendedIngredients'];

    List<ExtendedIngredient> extendedIngredients = extendedIngredientsList
        .map((ingredientJson) => ExtendedIngredient.fromJson(ingredientJson))
        .toList();

    return MealDetailModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      servings: json['servings'] ?? 0,
      readyInMinutes: json['readyInMinutes'] ?? 0,
      license: json['license'] ?? '',
      sourceName: json['sourceName'] ?? '',
      sourceUrl: json['sourceUrl'] ?? '',
      spoonacularSourceUrl: json['spoonacularSourceUrl'] ?? '',
      spoonacularScore: (json['spoonacularScore'] ?? 0).toDouble(),
      pricePerServing: json['pricePerServing'] ?? 0.0,
      dishTypes: List<String>.from(json['dishTypes'] ?? []),
      extendedIngredients: extendedIngredients,
      summary: json['summary'] ?? '',
    );
  }
}

class ExtendedIngredient {
  final String aisle;
  final double amount;
  final String consistency;
  final int id;
  final String image;
  final Measures measures;
  final List<String> meta;
  final String name;
  final String original;
  final String originalName;
  final String unit;

  ExtendedIngredient({
    required this.aisle,
    required this.amount,
    required this.consistency,
    required this.id,
    required this.image,
    required this.measures,
    required this.meta,
    required this.name,
    required this.original,
    required this.originalName,
    required this.unit,
  });

  factory ExtendedIngredient.fromJson(Map<String, dynamic> json) {
    return ExtendedIngredient(
      aisle: json['aisle'] ?? '',
      amount: (json['amount'] ?? 0).toDouble(),
      consistency: json['consistency'] ?? '',
      id: json['id'] ?? 0,
      image: json['image'] ?? '',
      measures: Measures.fromJson(json['measures'] ?? {}),
      meta: List<String>.from(json['meta'] ?? []),
      name: json['name'] ?? '',
      original: json['original'] ?? '',
      originalName: json['originalName'] ?? '',
      unit: json['unit'] ?? '',
    );
  }
}

class Measures {
  final Metric metric;
  final US us;

  Measures({
    required this.metric,
    required this.us,
  });

  factory Measures.fromJson(Map<String, dynamic> json) {
    return Measures(
      metric: Metric.fromJson(json['metric'] ?? {}),
      us: US.fromJson(json['us'] ?? {}),
    );
  }
}

class Metric {
  final double amount;
  final String unitLong;
  final String unitShort;

  Metric({
    required this.amount,
    required this.unitLong,
    required this.unitShort,
  });

  factory Metric.fromJson(Map<String, dynamic> json) {
    return Metric(
      amount: (json['amount'] ?? 0).toDouble(),
      unitLong: json['unitLong'] ?? '',
      unitShort: json['unitShort'] ?? '',
    );
  }
}

class US {
  final double amount;
  final String unitLong;
  final String unitShort;

  US({
    required this.amount,
    required this.unitLong,
    required this.unitShort,
  });

  factory US.fromJson(Map<String, dynamic> json) {
    return US(
      amount: (json['amount'] ?? 0).toDouble(),
      unitLong: json['unitLong'] ?? '',
      unitShort: json['unitShort'] ?? '',
    );
  }
}
