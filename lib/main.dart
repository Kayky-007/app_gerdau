import 'package:flutter/material.dart';
import 'package:login_gerdau/views/components/splash_screen.dart';
import 'package:login_gerdau/views/login_view.dart';
import 'package:login_gerdau/views/painel_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      routes: {
        '/': (context) => const TransicaoSplashScreen(),
        '/login': (context) => const LoginView(),
        '/painel': (context) => const PainelView(),
      },
      initialRoute: '/',
    );
  }
}