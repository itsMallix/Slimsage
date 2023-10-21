import 'package:miniproject/models/meals_models/metric.dart';
import 'package:miniproject/models/meals_models/us.dart';

class Measures {
  Us? us;
  Metric? metric;

  Measures({this.us, this.metric});

  factory Measures.fromJson(json) => Measures(
        us: json['us'] == null ? null : Us.fromJson(json['us']),
        metric: json['metric'] == null ? null : Metric.fromJson(json['metric']),
      );

  toJson() => {
        'us': us?.toJson(),
        'metric': metric?.toJson(),
      };
}
