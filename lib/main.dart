import 'package:flutter/material.dart';
import 'package:login_gerdau/views/login_view.dart';
import 'package:login_gerdau/views/painel_view.dart';

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
        '/': (context) => const LoginView(),
        '/painel': (context) => const PainelView(),
      },
      initialRoute: '/',
    );
  }
}