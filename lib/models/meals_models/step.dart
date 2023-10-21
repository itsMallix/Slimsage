import 'package:miniproject/models/meals_models/equipment.dart';
import 'package:miniproject/models/meals_models/ingredient.dart';
import 'package:miniproject/models/meals_models/length.dart';

class Step {
  int? number;
  String? step;
  List<Ingredient>? ingredients;
  List<Equipment>? equipment;
  Length? length;

  Step({
    this.number,
    this.step,
    this.ingredients,
    this.equipment,
    this.length,
  });

  factory Step.fromJson(json) => Step(
        number: json['number'] as int?,
        step: json['step'] as String?,
        ingredients: (json['ingredients'] as List<dynamic>?)
            ?.map((e) => Ingredient.fromjson(e))
            .toList(),
        equipment: (json['equipment'] as List<dynamic>?)
            ?.map((e) => Equipment.fromjson(e))
            .toList(),
        length: json['length'] == null ? null : Length.fromJson(json['length']),
      );

  toJson() => {
        'number': number,
        'step': step,
        'ingredients': ingredients?.map((e) => e.toJson()).toList(),
        'equipment': equipment?.map((e) => e.toJson()).toList(),
        'length': length?.toJson(),
      };
}
