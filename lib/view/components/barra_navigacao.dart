import 'package:flutter/material.dart';
import 'package:login_gerdau/view/cardapio_view.dart';
// <<<<<<< HEAD:lib/views/components/barra_navigacao.dart
// import 'package:login_gerdau/views/cardapio_view.dart';
// import 'package:login_gerdau/views/inicio_view.dart';
// import 'package:login_gerdau/views/perfil_view.dart';
// =======
import 'package:login_gerdau/view/inicio_view.dart';
import 'package:login_gerdau/view/perfil_view.dart';
// >>>>>>> 64ab53cb03f136cca7a9a7d267c2ba293bed69bd:lib/view/components/barra_navigacao.dart

class BarraNavigacao extends StatefulWidget {
  const BarraNavigacao({super.key});

  @override
  State<BarraNavigacao> createState() => _BarraNavigacaoState();
}

class _BarraNavigacaoState extends State<BarraNavigacao> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPageIndex,
        children: [
          Scaffold(
            body: InicioView(),
          ),
          Scaffold(
            body: CardapioView(),
          ),
          Scaffold(
            body: PerfilView(),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Color.fromRGBO(255, 204, 8, 1),
        selectedIndex: currentPageIndex,
        destinations: <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Inicio',
            selectedIcon: Icon(Icons.home),
          ),
          NavigationDestination(
            icon: Icon(Icons.fastfood_outlined),
            label: 'Cardápio',
            selectedIcon: Icon(Icons.fastfood_rounded),
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
