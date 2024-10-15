import 'package:flutter/material.dart';

class CincoEstralas extends StatefulWidget {
  const CincoEstralas({super.key});

  @override
  State<CincoEstralas> createState() => _ClassificacaoComponentState();
}

class _ClassificacaoComponentState extends State<CincoEstralas> {
  int _cliques = 0;

  void _atualizarClassificacao(int novaClassificacao) {
    setState(() {
      _cliques = novaClassificacao;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        const SizedBox(height: 20),
        Text(
          'Avaliação: $_cliques',
          style: const TextStyle(fontSize: 17),
        ),
      ],
    );
  }
}
