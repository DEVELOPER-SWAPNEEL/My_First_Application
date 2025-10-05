import 'package:flutter/material.dart';
import '../widgets/onboarding_page.dart';
import '../screens/sign_in_screen.dart';
import '../screens/sign_up_screen.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  List<Map<String, String>> getOnboardingData(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final logo = isDark
        ? 'assets/images/logo_dark.png'
        : 'assets/images/logo_light.png';

    return [
      {
        'image': logo,
        'title': '',
        'subtitle': '',
      },
      {
        'image': 'assets/images/man_intro.png',
        'title': 'Welcome to Vartaman Learning',
        'subtitle': 'Explore high-quality courses and learn at your own pace.',
      },
      {
        'image': 'assets/images/woman_intro.png',
        'title': 'Expert-Led Lectures',
        'subtitle': 'Access recorded lectures by industry experts and top IIT professors.',
      },
      {
        'image': 'assets/images/woman2_intro.png',
        'title': 'Interactive Learning',
        'subtitle': 'Engage with videos, quizzes, and real-time exercises for better understanding.',
      },
      {
        'image': 'assets/images/woman3_intro.png',
        'title': 'Track your progress',
        'subtitle': 'Monitor your course journey and stay motivated.',
      },
      {
        'image': 'assets/images/woman4_intro.png',
        'title': 'Earn Certificates!',
        'subtitle': 'Showcase your skills with industry-recognized certifications.',
      },
      {
        'image': 'assets/images/woman5_intro.png',
        'title': 'Unlock a world of knowledge',
        'subtitle': 'Sign in or create an account to begin your learning journey.',
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final onboardingData = getOnboardingData(context);
    final isLastPage = _currentPage == onboardingData.length - 1;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final subtitleColor = isDark ? Colors.white : Colors.grey;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final isLast = index == onboardingData.length - 1;
                  return OnboardingPage(
                    imagePath: onboardingData[index]['image']!,
                    title: onboardingData[index]['title']!,
                    subtitle: onboardingData[index]['subtitle']!,
                    subtitleColor: subtitleColor,
                    imageHeightFactor: isLast ? 0.45 : null,
                  );
                },
              ),
            ),

            if (_currentPage != 0 && _currentPage != onboardingData.length - 1) ...[
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onboardingData.length - 2,
                        (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (_currentPage - 1) == index
                            ? Colors.deepPurple
                            : Colors.grey.shade300,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      child: const Text(
                        'Next',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () {
                        _controller.jumpToPage(onboardingData.length - 1);
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],

            if (isLastPage)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignInScreen()),
                          );
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'SIGN IN',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignUpScreen()),
                          );
                        },

                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          side: const BorderSide(color: Colors.black),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'SIGN UP',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
