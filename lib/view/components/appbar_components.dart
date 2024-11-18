import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:background_app_bar/background_app_bar.dart';

class AppbarfotoComponents extends StatelessWidget  {
  final String title;

  const AppbarfotoComponents({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //COMO CHAMAR O APPBAR COMPONENT !!!
    // Há dois body

    // body: NestedScrollView(
    //     headerSliverBuilder: (context, innerBoxScrolled) => [
    //       AppbarfotoComponents(title: 'Cinco Estrelas'),
    //     ],

        //body: column{children[...]}

    // )



    return SliverAppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            child: const Icon(Icons.person_outline_outlined),
          ),
        ),
      ],
      expandedHeight: 70.0,
      floating: false,
      pinned: true,
      snap: false,
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      flexibleSpace: BackgroundFlexibleSpaceBar(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 13.0,
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(5.0, 5.0),
              ),
            ],
          ),
        ),
        centerTitle: false,
        titlePadding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
        background: ClipRect(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/gd2.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
