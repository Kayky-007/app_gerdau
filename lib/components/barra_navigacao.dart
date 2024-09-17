import 'package:flutter/material.dart';
import 'package:login_gerdau/views/inicio_view.dart';
import 'package:login_gerdau/views/perfil_view.dart';

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
            icon:  Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}