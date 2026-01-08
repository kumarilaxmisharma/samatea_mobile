import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:samatea/features/personalization/presentation/controllers/personalization_controller.dart';
import 'package:samatea/features/personalization/presentation/widgets/custom_option_tile.dart';
import 'package:samatea/features/personalization/presentation/widgets/ruler_picker.dart';

class PersonalizationScreen extends GetView<PersonalizationController> {
  const PersonalizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header with Back Button (only show if not on first page)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Obx(() => controller.currentPage > 0
                      ? IconButton(
                          icon: const Icon(Icons.arrow_back_ios, size: 20),
                          onPressed: controller.previousPage,
                        )
                      : const SizedBox(width: 40)), // Placeholder to keep title centered if needed
                ],
              ),
            ),
            
            Expanded(
              child: PageView(
                controller: controller.pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildIntroPage(), // Index 0
                  _buildGenderPage(),
                  _buildAgePage(),
                  _buildWeightPage(),
                  _buildHeightPage(),
                  _buildActivityLevelPage(),
                  _buildFitnessGoalPage(),
                  _buildDietPage(),
                  _buildCompletionPage(), // Index 8
                ],
              ),
            ),
            
            // Bottom Navigation Area
            Obx(() {
              // Hide indicators and show centered button for Intro (Page 0) and Completion (Page 8)
              if (controller.currentPage == 0 || controller.currentPage == 8) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: controller.nextPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6C58F2),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        controller.currentPage == 0 ? 'Get Started' : 'Start Journey',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                );
              }

              // Show Dots and Next button for question pages (1-7)
              return Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Page Indicator (Dots) - only for questions 1 to 7
                    Row(
                      children: List.generate(7, (index) {
                        return _buildDot(index == (controller.currentPage - 1));
                      }),
                    ),

                    // Next Button
                    ElevatedButton(
                      onPressed: controller.nextPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6C58F2),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Next',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.arrow_forward_ios, size: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF6C58F2) : Colors.grey[300],
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: Colors.black),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildSubtitle(String text) {
     return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, color: Colors.grey, height: 1.5),
        textAlign: TextAlign.center,
      ),
    );
  }

  // 0. Intro Page (New)
  Widget _buildIntroPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTitle('Are you ready to get\nstarted?'),
        _buildSubtitle('We will get some of your information to\npersonalize your experience with\nSomatea'),
        const SizedBox(height: 40),
        // Illustration for the runner
        SizedBox(
          height: 300,
          width: 300,
          child: Image.asset(
            'assets/images/onboarding/running.png',
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }

  // 1. Gender
  Widget _buildGenderPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTitle('How do you refer\nyourself?'),
          _buildSubtitle('We will get some of your information to\npersonalize your experience with\nSomatea'),
          const SizedBox(height: 40),
          Obx(() => CustomOptionTile(
            label: 'Female',
            isSelected: controller.selectedGender == 'Female',
            onTap: () => controller.setGender('Female'),
          )),
          Obx(() => CustomOptionTile(
            label: 'Male',
            isSelected: controller.selectedGender == 'Male',
            onTap: () => controller.setGender('Male'),
          )),
          Obx(() => CustomOptionTile(
            label: 'Non-binary',
            isSelected: controller.selectedGender == 'Non-binary',
            onTap: () => controller.setGender('Non-binary'),
          )),
           Obx(() => CustomOptionTile(
            label: 'Prefer not to say',
            isSelected: controller.selectedGender == 'Prefer not to say',
            onTap: () => controller.setGender('Prefer not to say'),
          )),
        ],
      ),
    );
  }

  // 2. Age
  Widget _buildAgePage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTitle('What is your age?'),
        _buildSubtitle('We will get some of your information to\npersonalize your experience with\nSomatea'),
        const SizedBox(height: 50),
        Obx(() => Text(
          '${controller.age}',
          style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
        )),
        const Icon(Icons.arrow_drop_up, size: 40, color: Colors.black),
        const SizedBox(height: 20),
        Obx(() => NumberPicker(
          value: controller.age,
          minValue: 10,
          maxValue: 100,
          axis: Axis.horizontal,
          itemHeight: 80,
          itemWidth: 80,
          textStyle: const TextStyle(fontSize: 24, color: Colors.grey, fontWeight: FontWeight.bold),
          selectedTextStyle: const TextStyle(fontSize: 32, color: Colors.black, fontWeight: FontWeight.bold),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: Colors.grey.withOpacity(0.5), width: 1),
              right: BorderSide(color: Colors.grey.withOpacity(0.5), width: 1),
            )
          ),
          onChanged: (value) => controller.setAge(value),
        )),
      ],
    );
  }

  // 3. Weight
  Widget _buildWeightPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTitle('What is your weight?'),
        _buildSubtitle('We will get some of your information to\npersonalize your experience with\nSomatea'),
        const SizedBox(height: 30),
        
        // Unit Toggle (Placeholder logic, assuming KG for now)
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 2)]
                ),
                child: const Text('KG', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
               const Padding(
                 padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                 child: Text('LB', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
               ),
            ],
          ),
        ),
        
        const SizedBox(height: 50),
        
        // Custom Ruler Picker
        Expanded(
          child: Obx(() => RulerPicker(
            minValue: 30,
            maxValue: 150,
            initialValue: controller.weight.round(),
            unit: 'Kg',
            isHorizontal: true,
            onChanged: (val) => controller.setWeight(val.toDouble()),
          )),
        ),
      ],
    );
  }

  // 4. Height
  Widget _buildHeightPage() {
     return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTitle('What is your height?'),
        _buildSubtitle('We will get some of your information to\npersonalize your experience with\nSomatea'),
        const SizedBox(height: 40),
        
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ruler
              SizedBox(
                width: 150,
                child: Obx(() => RulerPicker(
                  minValue: 100,
                  maxValue: 250,
                  initialValue: controller.height.round(),
                  unit: 'Cm',
                  isHorizontal: false, // Vertical layout
                  onChanged: (val) => controller.setHeight(val.toDouble()),
                )),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 5. Activity Level
  Widget _buildActivityLevelPage() {
     final levels = ['Sedentary', 'Lightly Active', 'Moderately Active', 'Very Active'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTitle('Your activity level?'),
           _buildSubtitle('How active are you on a daily basis?'),
          const SizedBox(height: 30),
          ...levels.map((level) => Obx(() => CustomOptionTile(
            label: level, 
            isSelected: controller.activityLevel == level, 
            onTap: () => controller.setActivityLevel(level),
          ))),
        ],
      ),
    );
  }

  // 6. Fitness Goal
  Widget _buildFitnessGoalPage() {
    final goals = ['Lose weight', 'Gain weight', 'Gain muscle', 'Achieve a physical milestone', 'Regular exercise routine', 'Improving flexibility', 'Reducing stress'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView( // Allow scrolling for many options
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             const SizedBox(height: 20),
            _buildTitle('What are your goal?'),
            _buildSubtitle('We will get some of your information to\npersonalize your experience with\nSomatea'),
            const SizedBox(height: 20),
            ...goals.map((goal) => Obx(() => CustomOptionTile(
              label: goal, 
              isSelected: controller.fitnessGoal == goal, 
              onTap: () => controller.setFitnessGoal(goal),
              isMultipleSelection: true, // Use checkbox style
            ))),
             const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // 7. Diet
  Widget _buildDietPage() {
    final diets = ['Fruits and Vegetables', 'Proteins', 'Grains', 'Dairy or Dairy Alternatives', 'Snacks', 'Fast Food or Takeout', 'Beverages', 'Dietary Preferences'];
    return Padding(
       padding: const EdgeInsets.symmetric(horizontal: 20),
       child: SingleChildScrollView(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            _buildTitle('What you usually\neat?'),
            _buildSubtitle('We will get some of your information to\npersonalize your experience with\nSomatea'),
            const SizedBox(height: 20),
            ...diets.map((diet) {
              return Obx(() {
                final isSelected = controller.selectedDiets.contains(diet);
                return CustomOptionTile(
                  label: diet,
                  isSelected: isSelected,
                  onTap: () => controller.toggleDiet(diet),
                  isMultipleSelection: true,
                );
              });
            }),
             const SizedBox(height: 20),
          ],
               ),
       ),
    );
  }

  // 8. Completion
  Widget _buildCompletionPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTitle('Everything is all set!\nNow let explore Samatea'),
        _buildSubtitle('Samatea will help you personalise\nyour fitness routine and improve your\ndiets'),
        const SizedBox(height: 40),
        // Illustration for the surfer
        SizedBox(
          height: 300,
          width: 300,
          child: Image.asset(
            'assets/images/onboarding/Surfing 1.png',
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}