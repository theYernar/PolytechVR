import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:polytechvr/database/links_data.dart';
import 'package:polytechvr/screens/vr_view/vr_view.dart';

class MainBuildind extends StatelessWidget {
  const MainBuildind({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
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
          context: context,
          title: 'Центральный холл', 
          image: 'assets/images/main_building/hall.png',
          link: Links.hall
        ),
        _buttonBuilder(
          context: context,
          title: 'Актовый зал', 
          image: 'assets/images/main_building/act_hall.png',
          link: Links.actHall
        ),
        _buttonBuilder(
          context: context,
          title: 'Конференц-зал', 
          image: 'assets/images/main_building/conference_hall.png',
          link: Links.conferenceHall
        ),
        _buttonBuilder(
          context: context,
          title: 'Библиотека', 
          image: 'assets/images/main_building/library.png',
          link: Links.library,
        ),
      ],
    );
  }

  IntrinsicHeight _buttonBuilder(
    {required BuildContext context, required String title, required String image,required String link}
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
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder:(context) => VRView(link: link, title: title,),));
                  },
                ),
              )
            ],
          ),
        ),
      );
  }
}