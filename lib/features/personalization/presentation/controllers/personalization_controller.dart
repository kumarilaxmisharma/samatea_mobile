import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samatea/app/navigation/bottom_navigation.dart';

class PersonalizationController extends GetxController {
  final PageController pageController = PageController();
  
  // Observables
  final _currentPage = 0.obs;
  int get currentPage => _currentPage.value;

  final Rx<String?> _selectedGender = Rx<String?>(null);
  String? get selectedGender => _selectedGender.value;

  final _age = 25.obs;
  int get age => _age.value;

  final _weight = 70.0.obs;
  double get weight => _weight.value;

  final _height = 170.0.obs;
  double get height => _height.value;

  final Rx<String?> _activityLevel = Rx<String?>(null);
  String? get activityLevel => _activityLevel.value;

  final Rx<String?> _fitnessGoal = Rx<String?>(null);
  String? get fitnessGoal => _fitnessGoal.value;

  final _selectedDiets = <String>[].obs;
  List<String> get selectedDiets => _selectedDiets;

  void onPageChanged(int page) {
    _currentPage.value = page;
  }

  void nextPage() {
    // Current Page 8 is the last page (Completion), so we navigate away
    if (_currentPage.value < 8) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      _currentPage.value++;
    } else {
      Get.offAll(() => const BottomNavigation());
    }
  }

  void previousPage() {
    if (_currentPage.value > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      _currentPage.value--;
    }
  }

  void setGender(String gender) => _selectedGender.value = gender;
  void setAge(int value) => _age.value = value;
  void setWeight(double value) => _weight.value = value;
  void setHeight(double value) => _height.value = value;
  void setActivityLevel(String level) => _activityLevel.value = level;
  void setFitnessGoal(String goal) => _fitnessGoal.value = goal;
  
  void toggleDiet(String diet) {
    if (_selectedDiets.contains(diet)) {
      _selectedDiets.remove(diet);
    } else {
      _selectedDiets.add(diet);
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
