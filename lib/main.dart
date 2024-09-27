import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:login_gerdau/views/login_view.dart';
import 'package:login_gerdau/views/painel_view.dart';
import 'package:page_transition/page_transition.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // cor do aplicativo
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
            backgroundColor: Colors.amber),
        '/painel': (context) => const PainelView(),
        '/login': (context) => const LoginView(),
      },
      initialRoute: '/',
    );
  }
}