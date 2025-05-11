import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:polytechvr/screens/home/home_screen.dart';
// import 'package:polytechvr/theme/colors/app_colors.dart';

class FirstOnboardingScreen extends StatelessWidget {
  // final PageController pageController;
  const FirstOnboardingScreen({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xfffff1f1),
      body: _HeaderWidget(),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  // final PageController pageController;
  const _HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/backgrounds/first_onboarding_background.png'
        ),
        Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 180,
                offset: Offset(-40, 0),
                color: const Color.fromARGB(255, 57, 24, 24)
              )
            ]
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40,),
                Text(
                  'Добро пожаловать в \nPolytech VR',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.nunito(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                  ),
                ),
                const SizedBox(height: 40,),

                Text(
                  'Погрузитесь в интерактивный обзор колледжа',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.nunito(
                    fontSize: 28,
                    color: Colors.lightBlue,
                    fontWeight: FontWeight.w600
                  ),
                ),

          
                const Spacer(),
                StartButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class StartButton extends StatelessWidget {
  // final PageController pageController;
  const StartButton({
    super.key,
  });
  
  // void nextNavigate() {
  //   pageController.animateToPage(
  //     1, 
  //     duration: const Duration(milliseconds: 500), 
  //     curve: Curves.easeInOut,
  //   );
  // } 

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xff35004c),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 8,
              color: Color(0xff7d009c)
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
                  style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder:(context) => HomeScreen(),));
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