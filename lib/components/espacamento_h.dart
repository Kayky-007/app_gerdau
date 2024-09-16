import 'package:flutter/material.dart';

class EspacamentoH extends StatelessWidget {
  final double h;
  const EspacamentoH({super.key, required this.h});

  @override
  Widget build(BuildContext context) {
    return Container(height: h);
  }
}