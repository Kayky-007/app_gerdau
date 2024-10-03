import 'package:flutter/material.dart';
import 'package:login_gerdau/view/components/espacamento_h.dart';

class CincoEstrelas extends StatefulWidget {
  const CincoEstrelas({super.key});

  @override
  State<CincoEstrelas> createState() => _CincoEstrelasState();
}

class _CincoEstrelasState extends State<CincoEstrelas> {
  int cliques = 0;

  void atualizarClassificacao(int novaClassificacao) {
    setState(() {
      cliques = novaClassificacao;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           EspacamentoH(h: 20),
          Text('Strogonoff de Frango', 
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
          ),
          EspacamentoH(h: 20),
          Image.asset('assets/images/prato_exemplo.jpg',
              width: 400,
          ),
          EspacamentoH(h: 20),
          const Text(
            'Avalie o Prato:',
            style: TextStyle(fontSize: 22),
          ),
         
          EspacamentoH(h: 15),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(5, (index) {
              return IconButton(
                icon: Icon(
                  cliques > index ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 40,
                ),
                onPressed: () => atualizarClassificacao(index + 1),
              );
            }),
          ),
          SizedBox(height: 20),
          Text(
            'Avaliação: $cliques',
            style: TextStyle(fontSize: 17),
          ),
          EspacamentoH(h: 20),

          ElevatedButton(
            onPressed: (){}, 
            child: Text('Enviar', style: TextStyle(fontSize: 17),),
          )

        ],
      ),
    );
  }
}