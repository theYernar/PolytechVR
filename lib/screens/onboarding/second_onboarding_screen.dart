import 'package:flutter/material.dart';
import 'package:polytechvr/screens/home/home_screen.dart';
import 'package:polytechvr/theme/colors/app_colors.dart';

class SecondOnboardingScreen extends StatelessWidget {
  final PageController pageController;

  const SecondOnboardingScreen({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xfffff1f1),
      body: _HeaderWidget(),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/backgrounds/second_onboarding_background.png'
        ),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40,),
              Text(
                'Добро пожаловать в \nPolytech VR',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
        
        
              const Spacer(),
              StartButton()
            ],
          ),
        ),
      ],
    );
  }
}

class StartButton extends StatelessWidget {
  const StartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.red,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 8,
              color: Colors.grey
            )
          ]
        ),
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Text(
                  'Начать',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder:(context) => HomeScreen(),)
                  );
                },
                borderRadius: BorderRadius.circular(14),
              ),
            )
          ],
        ),
      ),
    );
  }
}