import 'package:flutter/material.dart';
import 'package:login_gerdau/view/cardapio_view.dart';
// <<<<<<< HEAD:lib/views/components/barra_navigacao.dart
// import 'package:login_gerdau/views/cardapio_view.dart';
// import 'package:login_gerdau/views/inicio_view.dart';
// import 'package:login_gerdau/views/perfil_view.dart';
// =======
import 'package:login_gerdau/view/inicio_view.dart';
import 'package:login_gerdau/view/pedidos_view.dart';
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
            body: PedidosView(),
          ),
          Scaffold(
            body: PerfilView(),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBarTheme( // 'Envelopa' o Navigation Bar, foi usado pra trocar a cor do texto
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStatePropertyAll(  
            TextStyle(color: Colors.white)  // Deixa qualquer texto da navigation bar com a cor branca
          )
        ),
        child: NavigationBar(  // Navigation Bar, ATENÇÃO, ta sendo usado o Navigation Bar aqui, não o BottomNavigationBar
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          backgroundColor: Color.fromARGB(255, 1, 52, 96),
          indicatorColor: Color.fromRGBO(0, 74, 143, 1),
          selectedIndex: currentPageIndex,
          destinations: const <NavigationDestination>[
            NavigationDestination(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.white,
                ),
              label: 'Inicio',
              selectedIcon: Icon(
                Icons.home,
                color: Colors.white
                ),
            ),
            NavigationDestination(
              icon: Icon(
                Icons.fastfood_outlined,
                color: Colors.white,
              ),
              label: 'Cardápio',
              selectedIcon: Icon(
                Icons.fastfood_rounded,
                color: Colors.white,
              ),
            ),
            NavigationDestination(
              icon: Icon(
                Icons.person_outline,
                color: Colors.white,
                ),
                selectedIcon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                  ),
              label: 'Pedidos',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.person_outline,
                color: Colors.white,
                ),
                selectedIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                  ),
              label: 'Perfil',
            ),
          ],
        ),    
      ),
    );
  }
}
