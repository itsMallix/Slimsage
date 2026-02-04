import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:miniproject/components/screen_openai/widget_dots.dart';
import 'package:miniproject/components/theme.dart';
// FIX: Import model yang benar untuk chat completion
import 'package:miniproject/models/openai_feature/open_ai_chat_models.dart';

class RecommendationResultScreen extends StatelessWidget {
  final GPTChatData gptResponseData;

  const RecommendationResultScreen({super.key, required this.gptResponseData});

  @override
  Widget build(BuildContext context) {
    // FIX: Akses message.content (bukan text langsung)
    final hasValidResponse = gptResponseData.choices.isNotEmpty;
    final recommendationText = hasValidResponse
        ? gptResponseData.choices[0].message.content
        : "No recommendation available. Please try again.";

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Recommendation Result",
          style: DesignSystem.headlineMedium,
        ),
        leading: const BackButton(color: DesignSystem.black),
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
                    const SizedBox(width: 10),
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
              const SizedBox(height: 20),

              // Tampilkan error state jika tidak ada response
              if (!hasValidResponse)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.red.shade200),
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 48,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Failed to get recommendation",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        recommendationText,
                        style: DesignSystem.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: DesignSystem.black,
                        ),
                        child: const Text(
                          "Try Again",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              else
                // Tampilkan hasil rekomendasi dengan styling yang lebih baik
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.green.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.fitness_center,
                            color: DesignSystem.mainGreen,
                            size: 24,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "Your Workout Plan",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        recommendationText,
                        style: DesignSystem.bodyLarge,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
