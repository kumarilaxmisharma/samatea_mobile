import 'package:flutter/material.dart';
import 'package:samatea/app/navigation/bottom_navigation.dart';
import 'package:samatea/features/splash/domain/entities/onboarding_entity.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingEntity> _onboardingData = [
    OnboardingEntity(
      imageUrl: 'https://picsum.photos/seed/picsum/400/400',
      title: 'Track your fitness goal',
      description: 'customized workout routines based on the user\'s fitness level, goals, and preferences',
    ),
    OnboardingEntity(
      imageUrl: 'https://picsum.photos/seed/picsum2/400/400',
      title: 'Monitor your workout',
      description: 'customized workout routines based on the user\'s fitness level, goals, and preferences',
    ),
    OnboardingEntity(
      imageUrl: 'https://picsum.photos/seed/picsum3/400/400',
      title: 'Personalise workout routine',
      description: 'customized workout routines based on the user\'s fitness level, goals, and preferences',
    ),
    OnboardingEntity(
      imageUrl: 'https://picsum.photos/seed/picsum3/400/400',
      title: 'Nutrition plans',
      description: 'customized nutrition plans based on the user\'s dietary preferences and fitness goals',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingData.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingPage(
                    onboardingEntity: _onboardingData[index],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                if (_currentPage < _onboardingData.length - 1) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                } else {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) => const BottomNavigation(),
                    ),
                  );
                }
              },
              child: Text(
                _currentPage < _onboardingData.length - 1 ? 'Next' : 'Get Started',
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _onboardingData.length; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final OnboardingEntity onboardingEntity;

  const OnboardingPage({
    super.key,
    required this.onboardingEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          onboardingEntity.imageUrl,
          height: 300.0,
          width: 300.0,
        ),
        const SizedBox(height: 40.0),
        Text(
          onboardingEntity.title,
          style: const TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Text(
            onboardingEntity.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    );
  }
}
