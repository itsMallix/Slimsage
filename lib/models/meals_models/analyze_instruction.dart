import 'package:miniproject/models/meals_models/step.dart';

class AnalyzedInstructions {
  String? name;
  List<Step>? steps;

  AnalyzedInstructions({this.name, this.steps});

  factory AnalyzedInstructions.fromjson(json) {
    return AnalyzedInstructions(
      name: json['name'] as String?,
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) => Step.fromJson(e))
          .toList(),
    );
  }

  toJson() => {
        'name': name,
        'steps': steps?.map((e) => e.toJson()).toList(),
      };
}
