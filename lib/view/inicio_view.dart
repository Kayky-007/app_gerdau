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
      backgroundColor: Colors.grey[100],
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxScrolled) => [
          AppbarfotoComponents(title: 'Cinco Estrelas'),
          
        ],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              EspacamentoH(h: 20),
              Text(
                'Strogonoff de Frango',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey[800],
                ),
              ),
              EspacamentoH(h: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/images/prato_exemplo.jpg',
                  width: 380,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              EspacamentoH(h: 20),
              const Text(
                'Avalie o Prato:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              EspacamentoH(h: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CincoEstralas(),
                ],
              ),
              EspacamentoH(h: 30),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: const Color.fromARGB(255, 4, 18, 75),
                  elevation: 8,
                  shadowColor: const Color.fromARGB(255, 0, 0, 0),
                ),
                onPressed: () {},
                icon: Icon(Icons.send, color: const Color.fromARGB(255, 255, 255, 255),),
                label: Text(
                  'Enviar',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              EspacamentoH(h: 30),
            ],
          ),
        ),
      ),
    );
  }
}
