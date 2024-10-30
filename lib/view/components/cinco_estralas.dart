import 'package:flutter/material.dart';

class CincoEstrelas extends StatefulWidget {
  const CincoEstrelas({super.key});

  @override
  State<CincoEstrelas> createState() => _CincoEstrelasState();
}

class _CincoEstrelasState extends State<CincoEstrelas> {
  int _cliques = 0;

  void _atualizarClassificacao(int novaClassificacao) {
    setState(() {
      _cliques = novaClassificacao;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Avalie o Prato:',
          style: TextStyle(fontSize: 22),
        ),
        SizedBox(height: 15),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(5, (index) {
            return IconButton(
              icon: Icon(
                _cliques > index ? Icons.star : Icons.star_border,
                color: Colors.amber,
                size: 40,
              ),
              onPressed: () => _atualizarClassificacao(index + 1),
            );
          }),
        ),
        SizedBox(height: 20),
        Text(
          'Avaliação: $_cliques',
          style: TextStyle(fontSize: 17),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          child: const Text(
            'Enviar',
            style: TextStyle(fontSize: 17),
          ),
        ),
      ],
    );
  }
}
