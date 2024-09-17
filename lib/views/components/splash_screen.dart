import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:login_gerdau/views/login_view.dart';
import 'package:page_transition/page_transition.dart';
 
void main() => runApp(const TransicaoSplashScreen());
 
class TransicaoSplashScreen extends StatefulWidget {
  const TransicaoSplashScreen({super.key});
 
  @override
  State<TransicaoSplashScreen> createState() => _TransicaoSplashScreenState();
}
 
class _TransicaoSplashScreenState extends State<TransicaoSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
        title: 'Clean Code',
        home: AnimatedSplashScreen(
            duration: 2000,
            splash: 'assets/images/logo_splashscreen.png',
            splashIconSize: 200,
            nextScreen: LoginView(), // O reponsável pela Tela Inial irá chamá-la aqui, 'LoginView' está sendo usado de exemplo
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.topToBottom,
            backgroundColor: Color.fromARGB(255, 247,196,0)
            )
            );
  }
}
 
 