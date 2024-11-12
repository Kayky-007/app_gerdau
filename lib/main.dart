import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/dropdown_alert.dart';
import 'package:login_gerdau/view/cardapio_view.dart';

import 'package:login_gerdau/view/login_view.dart';
import 'package:login_gerdau/view/painel_view.dart';
import 'package:login_gerdau/view/pedidos_view.dart';
import 'package:page_transition/page_transition.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => Stack(
        children: [child!, DropdownAlert()],
      ),
      //cores do app
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
            foregroundColor: Colors.white,
            backgroundColor: Color.fromRGBO(1, 52, 91, 1)),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey), 
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Color.fromRGBO(129, 108, 12, 1), width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          labelStyle: TextStyle(color: Colors.grey), 
          floatingLabelStyle:
              TextStyle(color: Color.fromRGBO(129, 108, 12, 1)), 
        ),
      ),
      routes: {
        // Splash Screen iniciando a aplicação e redirecionando para a tela de login
        '/': (context) => AnimatedSplashScreen(
            duration: 2000,
            splash: 'assets/images/logoGRSA_splashscreen.png',
            nextScreen: LoginView(),
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.topToBottom,
            splashIconSize: 150,
            backgroundColor: Colors.white),
        '/painel': (context) => const PainelView(),
        '/login': (context) => const LoginView(),
        '/cardapio': (context) => const CardapioView(),
        '/pedidos': (context) => const PedidosView(),
      },
      initialRoute: '/',
    );
  }
}
