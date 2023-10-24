import 'dart:convert';

import 'package:miniproject/constant/open_ai.dart';
import 'package:miniproject/models/openai_feature/open_ai_models.dart';
import 'package:miniproject/models/openai_feature/open_ai_usage.dart';
import 'package:http/http.dart' as http;

class RecommendationService {
  static Future<GPTData> getRecommendation({
    required String height,
    required String weight,
  }) async {
    late GPTData gptData = GPTData(
      id: "",
      object: "",
      created: 0,
      model: "",
      choices: [],
      usage: UsageData(
        promptToken: 0,
        completionToken: 0,
        totalTokens: 0,
      ),
    );
    try {
      var url = Uri.parse("https://api.openai.com/v1/completions");
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Charset": "utf-8",
        "Authorization": "Bearer $apiKey",
      };

      String bodyWeight = weight;

      String prompData =
          "Kamu adalah seorang ahli kebugaran, berikan saya beberapa rekomendasi workout dengan tinggi badan $height dan berat badan $bodyWeight dengan hitungan setiap resp";
      final data = jsonEncode({
        "model": "text-davinci-003",
        "prompt": prompData,
        "max_tokens": 300,
        "temperature": 0.7,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0,
      });

      var response = await http.post(
        url,
        headers: headers,
        body: data,
      );

      if (response.statusCode == 200) {
        gptData = gptDataFromJson(response.body);
      } else {
        print(response.statusCode);
      }
    } catch (err) {
      print(err);
    }
    return gptData;
  }
}
