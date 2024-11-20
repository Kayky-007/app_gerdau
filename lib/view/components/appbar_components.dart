import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:background_app_bar/background_app_bar.dart';

class AppbarfotoComponents extends StatelessWidget {
  final String title;

  const AppbarfotoComponents({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      actions: [
      ],
      expandedHeight: 70.0, 
      floating: false,
      pinned: true,
      snap: false,
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      flexibleSpace: BackgroundFlexibleSpaceBar(
        centerTitle: true, // Centraliza o título
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
        titlePadding: const EdgeInsets.only(bottom: 10.0), 
        background: ClipRect(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/gd2.png"),
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
