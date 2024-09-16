import 'package:flutter/material.dart';
import 'package:login_gerdau/components/espacamento_h.dart';

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
        children: [
          const Text(
            'Avalie o Prato:',
            style: TextStyle(fontSize: 24),
          ),
          EspacamentoH(h: 20),
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
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}