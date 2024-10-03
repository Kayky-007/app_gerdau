import 'package:flutter/material.dart';
import 'package:login_gerdau/view/components/barra_navigacao.dart';

class PainelView extends StatefulWidget {
  const PainelView({super.key});

  @override
  State<PainelView> createState() => _PainelViewState();
}

class _PainelViewState extends State<PainelView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(child: BarraNavigacao())
    );
  }
}