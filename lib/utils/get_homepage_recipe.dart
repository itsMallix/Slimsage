import 'package:dio/dio.dart';
import 'package:miniproject/models/meals_models/food_type.dart';
import 'package:miniproject/models/meals_models/model_failure.dart';
import 'package:miniproject/utils/api_key.dart';
import 'package:miniproject/utils/get_recipe_info.dart';

class GetHomeRecipes {
  var key = ApiKey.keys;

  final dio = Dio();

  Future<FoodTypeList> getRecipes(String type, int no) async {
    var url = BASE_URL + "/random?number=$no&tags=$type" + '&apiKey=' + key;
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      return FoodTypeList.fromJson(response.data['recipes']);
    } else if (response.statusCode == 401) {
      throw Failure(code: 401, message: response.data['message']);
    } else {
      print(response.statusCode);
      throw Failure(
          code: response.statusCode!, message: response.statusMessage!);
    }
  }
}
