import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:login_gerdau/view/cardapio_view.dart';
// <<<<<<< HEAD
// import 'package:login_gerdau/views/cardapio_view.dart';
// import 'package:login_gerdau/views/login_view.dart';
// import 'package:login_gerdau/views/painel_view.dart';
// =======
import 'package:login_gerdau/view/login_view.dart';
import 'package:login_gerdau/view/painel_view.dart';
// >>>>>>> 64ab53cb03f136cca7a9a7d267c2ba293bed69bd
import 'package:page_transition/page_transition.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      //cores do app
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.white,
          backgroundColor: Color.fromRGBO(1, 52, 91, 1)
        )

      ),
      routes: {
        // Splash Screen iniciando a aplicação e redirecionando para a tela de login
        '/': (context) => AnimatedSplashScreen(
            duration: 2000,
            splash: 'assets/images/logo_splashscreen.png',
            nextScreen: LoginView(),
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.topToBottom,
            splashIconSize: 150,
            backgroundColor: Color.fromARGB(255, 1, 52, 96)),
        '/painel': (context) => const PainelView(),
        '/login': (context) => const LoginView(),
        '/cardapio': (context) => const CardapioView(),
      },
      initialRoute: '/',
    );
  }
}

