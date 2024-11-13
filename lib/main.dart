import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/dropdown_alert.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_gerdau/view/cardapio_view.dart';
import 'package:login_gerdau/view/login_view.dart';
import 'package:login_gerdau/view/painel_view.dart';
import 'package:login_gerdau/view/pedidos_view.dart';
import 'package:page_transition/page_transition.dart';
 
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
 
  // Instanciando o FlutterSecureStorage

  final storage = FlutterSecureStorage();
 
  // Obtendo o token armazenado

  String? token = await storage.read(key: 'token');
 
  runApp(MyApp(token: token));

}
 
class MyApp extends StatelessWidget {
  final String? token;
 
  const MyApp({super.key, this.token});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => Stack(
        children: [child!, DropdownAlert()],
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.white,
          backgroundColor: Color.fromRGBO(1, 52, 91, 1),
        ),

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

        '/': (context) => AnimatedSplashScreen(
              duration: 2000,
              splash: 'assets/images/logoGRSA_splashscreen.png',

              nextScreen: token != null
                  ? const PainelView() // Se o token estiver presente, vai para o painel

                  : const LoginView(), // Caso contrário, vai para a tela de login

              splashTransition: SplashTransition.fadeTransition,

              pageTransitionType: PageTransitionType.topToBottom,

              splashIconSize: 150,

              backgroundColor: Colors.white,

            ),

        '/painel': (context) => const PainelView(),

        '/login': (context) => const LoginView(),

        '/cardapio': (context) => const CardapioView(),

        '/pedidos': (context) =>  PedidosView(),

      },

      initialRoute: '/',

    );

  }

}

 