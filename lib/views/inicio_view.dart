import 'package:flutter/material.dart';
import 'package:login_gerdau/views/components/cinco_estralas.dart';

class InicioView extends StatefulWidget {
  const InicioView({super.key});

  @override
  State<InicioView> createState() => _InicioViewState();
}

class _InicioViewState extends State<InicioView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CincoEstrelas(),
              
    );
  }
}