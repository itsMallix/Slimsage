import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:miniproject/components/screen_openai/widget_dots.dart';
import 'package:miniproject/components/theme.dart';
import 'package:miniproject/constant/open_ai.dart' as Env;
import 'package:miniproject/utils/service_open_ai/open_ai_recomm_service_option2.dart';
import 'package:miniproject/views/screen_recommendation/screen_result_recommendation_option2.dart';

class RecommendScreen extends StatefulWidget {
  const RecommendScreen({super.key});

  @override
  State<RecommendScreen> createState() => _RecommendScreenState();
}

class _RecommendScreenState extends State<RecommendScreen> {
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  bool isLoading = false;

  void _getRecommendations() async {
    if (!_formKey.currentState!.validate()) {
      Navigator.pop(context);
      return;
    }

    try {
      final result = await RecommendationService.getRecommendation(
        height: _heightController.text,
        weight: _weightController.text,
      );

      // Tutup loading dialog
      if (mounted) {
        Navigator.pop(context);
      }

      // Validasi apakah result memiliki data yang valid
      if (result.choices.isEmpty) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Tidak ada rekomendasi yang diterima. Coba lagi."),
              backgroundColor: Colors.red,
            ),
          );
        }
        return;
      }

      // Navigate ke result screen - FIX: result sudah type GPTChatData
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => RecommendationResultScreen(
              gptResponseData: result, // result adalah GPTChatData
            ),
          ),
        );
      }
    } catch (err) {
      if (mounted) {
        Navigator.pop(context);
      }

      // Tampilkan error message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Gagal mendapatkan rekomendasi: creditnya sudah habis wok 😹🙏",
            ),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 4),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Workout Recommendation",
          style: DesignSystem.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                            "assets/images/openAiScreen/ai_2.svg",
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
                const SizedBox(height: 10),
                const Text(
                  "The AI-Powered Workout Recommendation feature is one of the advanced features in a fitness application that utilizes artificial intelligence (AI) to provide personalized exercise recommendations",
                  style: DesignSystem.labelLarge,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: DesignSystem.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: SizedBox(
                          height: 80,
                          width: 80,
                          child: SvgPicture.asset(
                            "assets/images/openAiScreen/ai_1.svg",
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Text(
                        "Let's Check This Out! . . . ",
                        style: DesignSystem.headlineSmallWhite,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.height_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Enter Body Height (cm)",
                    labelText: "Height",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your height!';
                    }
                    final height = double.tryParse(value);
                    if (height == null || height <= 0) {
                      return 'Please enter a valid height!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.accessibility_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Enter Body Weight (kg)",
                    labelText: "Weight",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your weight!';
                    }
                    final weight = double.tryParse(value);
                    if (weight == null || weight <= 0) {
                      return 'Please enter a valid weight!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 100),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: DesignSystem.black,
                    ),
                    onPressed: isLoading
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });

                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => WillPopScope(
                                  onWillPop: () async => false,
                                  child: const Center(
                                    child: CircularProgressIndicator(
                                      color: DesignSystem.mainGreen,
                                    ),
                                  ),
                                ),
                              );
                              _getRecommendations();
                            }
                          },
                    child: isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Text(
                            "Get Recommendation",
                            style: DesignSystem.headlineSmallWhite,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
