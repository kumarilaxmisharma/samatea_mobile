import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:samatea/features/auth/presentation/controllers/auth_controller.dart';
import 'package:samatea/features/auth/presentation/screens/login_screen.dart';
import 'package:samatea/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:samatea/features/auth/presentation/widgets/social_button.dart';

class SignupScreen extends GetView<AuthController> {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Signup',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              
              CustomTextField(
                label: 'Name',
                hint: 'Enter your name',
                controller: controller.signupNameController,
              ),
              const SizedBox(height: 20),
              
              CustomTextField(
                label: 'Email',
                hint: 'Enter your email',
                controller: controller.signupEmailController,
              ),
              const SizedBox(height: 20),
              
              Obx(() => CustomTextField(
                label: 'Password',
                hint: 'Enter your password',
                controller: controller.signupPasswordController,
                isPassword: true,
                isPasswordVisible: controller.isSignupPasswordVisible.value,
                onTogglePassword: controller.toggleSignupPasswordVisibility,
              )),
              const SizedBox(height: 20),
              
              Obx(() => CustomTextField(
                label: 'Confirm Password',
                hint: 'Confirm password',
                controller: controller.signupConfirmPasswordController,
                isPassword: true,
                isPasswordVisible: controller.isSignupConfirmPasswordVisible.value,
                onTogglePassword: controller.toggleSignupConfirmPasswordVisibility,
              )),
              const SizedBox(height: 30),
              
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.signup,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6C58F2), // Purple
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Signup',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              
              const Center(
                child: Text(
                  'By continuing, you agree to\nTerms of Use and Privacy Policy.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
              const SizedBox(height: 30),
              
              const Center(
                child: Text(
                  'Or Sign up with',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 20),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(icon: FontAwesomeIcons.apple, onTap: () {}),
                  const SizedBox(width: 20),
                  SocialButton(
                    icon: FontAwesomeIcons.facebookF, 
                    color: const Color(0xFF1877F2), // Facebook Blue
                    onTap: () {}
                  ),
                  const SizedBox(width: 20),
                  SocialButton(
                    icon: FontAwesomeIcons.google, 
                    color: const Color(0xFFDB4437), // Google Red
                    onTap: () {}
                  ),
                  const SizedBox(width: 20),
                  SocialButton(
                    icon: FontAwesomeIcons.telegram, 
                    color: const Color(0xFF0088CC), // Telegram Blue
                    onTap: () {}
                  ),
                ],
              ),
              const SizedBox(height: 30),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? ", style: TextStyle(color: Colors.grey)),
                  GestureDetector(
                    onTap: () => Get.off(() => const LoginScreen()),
                    child: const Text(
                      'Signin',
                      style: TextStyle(
                        color: Color(0xFF6C58F2),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
