import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:samatea/features/auth/presentation/controllers/auth_controller.dart';
import 'package:samatea/features/auth/presentation/screens/signup_screen.dart';
import 'package:samatea/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:samatea/features/auth/presentation/widgets/social_button.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

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
                  'Login',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              
              CustomTextField(
                label: 'Email',
                hint: 'Enter your email',
                controller: controller.loginEmailController,
              ),
              const SizedBox(height: 20),
              
              Obx(() => CustomTextField(
                label: 'Password',
                hint: 'Enter your password',
                controller: controller.loginPasswordController,
                isPassword: true,
                isPasswordVisible: controller.isLoginPasswordVisible.value,
                onTogglePassword: controller.toggleLoginPasswordVisibility,
              )),
              
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forget password',
                    style: TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6C58F2), // Purple
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              
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
                  SocialButton(icon: FontAwesomeIcons.apple, onTap: () {}), // Apple is standard black
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
              const SizedBox(height: 40),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have account yet? ", style: TextStyle(color: Colors.grey)),
                  GestureDetector(
                    onTap: () => Get.off(() => const SignupScreen()),
                    child: const Text(
                      'Signup',
                      style: TextStyle(
                        color: Color(0xFF6C58F2),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
