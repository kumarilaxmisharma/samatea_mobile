import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samatea/features/splash/presentation/screens/onboarding_screen.dart';

class AuthController extends GetxController {
  // Login Text Controllers
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  // Signup Text Controllers
  final signupNameController = TextEditingController();
  final signupEmailController = TextEditingController();
  final signupPasswordController = TextEditingController();
  final signupConfirmPasswordController = TextEditingController();

  // Observables for password visibility
  final isLoginPasswordVisible = false.obs;
  final isSignupPasswordVisible = false.obs;
  final isSignupConfirmPasswordVisible = false.obs;

  void toggleLoginPasswordVisibility() {
    isLoginPasswordVisible.value = !isLoginPasswordVisible.value;
  }

  void toggleSignupPasswordVisibility() {
    isSignupPasswordVisible.value = !isSignupPasswordVisible.value;
  }

  void toggleSignupConfirmPasswordVisibility() {
    isSignupConfirmPasswordVisible.value = !isSignupConfirmPasswordVisible.value;
  }

  void login() {
    // Implement login logic here
    // For now, navigate to Onboarding
    Get.offAll(() => const OnboardingScreen());
  }

  void signup() {
    // Implement signup logic here
    // For now, navigate to Onboarding
    Get.offAll(() => const OnboardingScreen());
  }
  
  @override
  void onClose() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
    signupNameController.dispose();
    signupEmailController.dispose();
    signupPasswordController.dispose();
    signupConfirmPasswordController.dispose();
    super.onClose();
  }
}
