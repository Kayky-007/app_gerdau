import 'package:flutter/material.dart';
import 'package:login_gerdau/view/components/appbar_components.dart';
import 'package:login_gerdau/view/components/cinco_estralas.dart';
import 'package:login_gerdau/view/components/espacamento_h.dart';

class InicioView extends StatefulWidget {
  const InicioView({super.key});

  @override
  State<InicioView> createState() => _InicioViewState();
}

class _InicioViewState extends State<InicioView> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxScrolled) => [
          AppbarfotoComponents(title: 'Cinco Estrelas'),
        ],
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EspacamentoH(h: 20),
              Text(
                'Strogonoff de Frango',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              EspacamentoH(h: 20),
              Image.asset(
                'assets/images/prato_exemplo.jpg',
                width: 400,
              ),
              EspacamentoH(h: 20),
              const Text(
                'Avalie o Prato:',
                style: TextStyle(fontSize: 22),
              ),
              EspacamentoH(h: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CincoEstralas()
              ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Enviar',
                  style: TextStyle(fontSize: 17),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}