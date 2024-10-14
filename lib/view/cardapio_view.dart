import 'package:flutter/material.dart';

class CardapioView extends StatefulWidget {
  const CardapioView({super.key});

  @override
  State<CardapioView> createState() => _CardapioViewState();
}

class _CardapioViewState extends State<CardapioView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Cardápio")),
        ),
        body: Column(
      children: [
        SizedBox(height: 100),
        SizedBox(
          height: 230,
          child: PageView(
            children: [
              Image.asset('assets/images/gd1.jpg', fit: BoxFit.cover),
              Image.asset('assets/images/gd2.jpg', fit: BoxFit.cover),
              Image.asset('assets/images/gd3.jpg', fit: BoxFit.cover),
            ],
          ),
        ),
      ],
    ));
  }
}
