import 'package:flutter/material.dart';
import 'package:login_gerdau/views/login_view.dart';
import 'package:login_gerdau/views/painel_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // Cores do aplicativo
      theme: ThemeData(
        // Cor do scaffold
        scaffoldBackgroundColor: Colors.white,

        // Cor do appbar
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromRGBO(1, 52, 91, 1),
          foregroundColor: Colors.white
        )

      ),
      routes: {
        '/': (context) => const LoginView(),
        '/painel': (context) => const PainelView(),
      },
      initialRoute: '/',
    );
  }
}