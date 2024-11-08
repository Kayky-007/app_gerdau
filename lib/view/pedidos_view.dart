import 'package:flutter/material.dart';
import 'package:login_gerdau/view/components/appbar_components.dart';
import 'package:login_gerdau/view/components/cardPedidos.dart';

class PedidosView extends StatefulWidget {
  const PedidosView({super.key});

  @override
  State<PedidosView> createState() => _PedidosViewState();
}

class _PedidosViewState extends State<PedidosView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxScrolled) => [
          AppbarfotoComponents(title: 'Pedidos'),
        ],
        body: ListView(
          children:  [
            // Cards listados apenas para exemplo
            CardPedidos(
            prato: 'Bife grelhado',
            buffet: 'Dia a Dia',
            tamanho: 'Grande',
            horario: '12:30 PM',
            imagemPath: 'assets/images/comida_card.png'),
            SizedBox(height: 20),
            CardPedidos(
            prato: 'Espaguete à bolonhesa',
            buffet: 'Clássico',
            tamanho: 'Pequeno',
            horario: '12:34 PM',
            imagemPath: 'assets/images/comida_card3.png'),
            SizedBox(height: 20),
            CardPedidos(
            prato: 'Costeletas de porco',
            buffet: 'Especiale',
            tamanho: 'Pequeno',
            horario: '12:30 PM',
            imagemPath: 'assets/images/comida_card2.png'),
            SizedBox(height: 20),
            CardPedidos(
            prato: 'Frango grelhado',
            buffet: 'Natural',
            tamanho: 'Pequeno',
            horario: '12:32 PM',
            imagemPath: 'assets/images/comida_card4.png'),
          ],
        ),
      ),
    );
  }
}
