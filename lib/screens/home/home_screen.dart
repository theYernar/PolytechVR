import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:polytechvr/database/links_data.dart';
import 'package:polytechvr/screens/home/audience/audience_screen.dart';
import 'package:polytechvr/screens/home/main_building/main_building_screen.dart';
import 'package:polytechvr/screens/vr_view/vr_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: SafeArea(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: _HeaderWidget(),
        ),
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true, // чтобы grid занял только нужную высоту
      physics: NeverScrollableScrollPhysics(), // отключает прокрутку
      crossAxisCount: 1, // 2 колонки
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.8, // можно поиграть для нужной формы
      children: [
        _buttonBuilder(
          title: 'Вид с улицы', 
          image: 'assets/images/street_view.png',
          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder:(context) => VRView(link: Links.street, title: 'Вид с улицы',),))
        ),
        _buttonBuilder(
          title: 'Главный корпус', 
          image: 'assets/images/main_building.png',
          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder:(context) => MainBuildind(),))
        ),
        _buttonBuilder(
          title: 'Аудитории', 
          image: 'assets/images/audience.png',
          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder:(context) => Audience(),))
        ),
        _buttonBuilder(
          title: 'IT center', 
          image: 'assets/images/itcenter.png',
          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder:(context) => VRView(link: Links.itCenterHall, title: 'IT center'),))
        ),
      ],
    );
  }

  IntrinsicHeight _buttonBuilder(
    {required String title, required String image, required Function() onTap}
  ) {
    return IntrinsicHeight(
        child: Container(
          width: double.infinity,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent,
            borderRadius: BorderRadius.circular(14)
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 80,
                      offset: Offset(0, 160),
                      color: const Color.fromARGB(255, 0, 0, 0)
                    )
                  ]
                ),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text(
                    title,
                    style: GoogleFonts.nunito(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onTap,
                ),
              )
            ],
          ),
        ),
      );
  }
}