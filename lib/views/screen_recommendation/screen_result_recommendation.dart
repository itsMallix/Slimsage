import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miniproject/components/screen_openai/widget_dots.dart';
import 'package:miniproject/components/theme.dart';
import 'package:miniproject/models/openai_feature/open_ai_models.dart';

class RecommendationResultScreen extends StatelessWidget {
  final GPTData gptResponseData;
  const RecommendationResultScreen({super.key, required this.gptResponseData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Recommendation Result",
          style: DesignSystem.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: DesignSystem.black,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 80,
                        width: 80,
                        child: SvgPicture.asset(
                          "assets/images/openAiScreen/ai_4.svg",
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0, bottom: 20.0),
                          child: SizedBox(
                            width: 200,
                            child: Text(
                              "Get Recommendation With AI Technology.",
                              style: DesignSystem.headlineSmallWhite,
                            ),
                          ),
                        ),
                        buildDots(context),
                      ],
                    ),
                  ],
                ),
              ),
              const Text(
                "Workout Recommendation",
                style: DesignSystem.headlineSmall,
              ),
              const SizedBox(height: 20),
              Text(
                gptResponseData.choices[0].text,
                textAlign: TextAlign.start,
              )
            ],
          ),
        ),
      ),
    );
  }
}
