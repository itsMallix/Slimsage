import 'package:flutter/material.dart';
import 'package:miniproject/components/screen_bmi_calcullator/screen_bmi_result.dart';
import 'package:miniproject/components/theme.dart';
import 'package:miniproject/models/bmi_calcullator/counter_bmi.dart';

enum Gender {
  male,
  female,
}

class GenderWidget extends StatefulWidget {
  const GenderWidget({super.key});

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  Color inactiveColor = DesignSystem.white;
  Color activeColor = DesignSystem.mainGreen;
  Gender? selectedGender;
  int height = 160;
  int weight = 45;
  int age = 15;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: DesignSystem.mainRed,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                child: Container(
                  height: 150,
                  width: 155,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: DesignSystem.maingrey),
                    color: selectedGender == Gender.male
                        ? activeColor
                        : inactiveColor,
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.male,
                        color: DesignSystem.black,
                        size: 45,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Male",
                        style: DesignSystem.headlineSmall,
                      )
                    ],
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                child: Container(
                  height: 150,
                  width: 155,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: DesignSystem.maingrey),
                    color: selectedGender == Gender.female
                        ? activeColor
                        : inactiveColor,
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.female,
                        color: DesignSystem.black,
                        size: 45,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Female",
                        style: DesignSystem.headlineSmall,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: DesignSystem.maingrey),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "HEIGHT",
                  style: DesignSystem.headlineMedium,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: DesignSystem.headlineSmall,
                    ),
                    const Text(
                      "cm",
                      style: DesignSystem.bodyLarge,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      activeTrackColor: DesignSystem.mainGreen,
                      overlayColor: DesignSystem.grey,
                      inactiveTrackColor: DesignSystem.maingrey,
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 16.0),
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                      thumbColor: DesignSystem.mainBlue),
                  child: Slider(
                    value: height.toDouble(),
                    min: 100,
                    max: 200,
                    onChanged: (double value) {
                      setState(() {
                        height = value.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                height: 150,
                width: 155,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: DesignSystem.maingrey),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Weight",
                      style: DesignSystem.headlineSmall,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      weight.toString(),
                      style: DesignSystem.headlineSmall,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: DesignSystem.mainRed,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                if (weight > 10) {
                                  weight--;
                                }
                              });
                            },
                            icon: const Icon(
                              Icons.remove,
                              color: DesignSystem.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        CircleAvatar(
                          backgroundColor: DesignSystem.mainBlue,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            icon: const Icon(
                              Icons.add,
                              color: DesignSystem.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Spacer(),
              Container(
                height: 150,
                width: 155,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: DesignSystem.maingrey),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Age",
                      style: DesignSystem.headlineSmall,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      age.toString(),
                      style: DesignSystem.headlineSmall,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: DesignSystem.mainRed,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                if (age > 5) {
                                  age--;
                                }
                              });
                            },
                            icon: const Icon(
                              Icons.remove,
                              color: DesignSystem.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        CircleAvatar(
                          backgroundColor: DesignSystem.mainBlue,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            icon: const Icon(
                              Icons.add,
                              color: DesignSystem.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              navigateToResult(12.0);
              setState(() {});
            },
            child: Container(
              height: 50,
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: DesignSystem.mainBlue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  "Calculate",
                  style: DesignSystem.headlineSmallWhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void navigateToResult(double result) {
    CalculateBmi result = CalculateBmi(height: height, weight: weight);
    setState(() {});
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BmiResultScreen(
          result: result.calculateResult(),
          message: result.message,
          description: result.getDescription(),
        ),
      ),
    );
    setState(() {});
  }
}
