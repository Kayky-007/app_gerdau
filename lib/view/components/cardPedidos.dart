import 'package:flutter/material.dart';
import 'package:login_gerdau/controller/pedidos_controller.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:login_gerdau/controller/pratos_controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CardPedidos extends StatelessWidget {
  final int idPrato;
  final String nomePrato;
  final String descricao;
  final String dataAgendamento;
  final String dataPedido;
  final String imagemPath;
  final int idPedido;
  final Function(int) onPedidoCancelado;
  final void Function(int, int) onEnviarAvaliacao; // Função para enviar avaliação

  CardPedidos({
    super.key,
    required this.nomePrato,
    required this.descricao,
    required this.dataAgendamento,
    required this.dataPedido,
    required this.imagemPath,
    required this.idPedido,
    required this.onPedidoCancelado,
    required this.idPrato,
    required this.onEnviarAvaliacao,
  });

  final PedidosController _pedidosController = PedidosController();
  final PratosController _pratosController = PratosController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showAlertPedido(context),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Card(
          color: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 6,
          shadowColor: Colors.black.withOpacity(0.3),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imagemPath,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        nomePrato,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Descrição: $descricao',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Data Agendamento: $dataAgendamento',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () async {
                    bool sucesso = await _pedidosController.cancelarPedido(idPedido);
                    if (sucesso) {
                      onPedidoCancelado(idPedido);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 16,
                    ),
                  ),
                  child: Text(
                    'Cancelar',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showAlertPedido(BuildContext context) async {
    try {
      final prato = await _pratosController.listarPratoCardapioDia(idPrato, dataAgendamento);
      final ingredientes = prato.ingredientes ?? "Ingredientes não encontrados"; 

      final listaIngredientes = ingredientes.split(','); // Alterar para o delimitador adequado, se necessário

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.grey[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: Color.fromRGBO(255, 204, 0, 1),
                ),
                SizedBox(width: 8),
                Text(
                  'Detalhes do Pedido',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Ingredientes:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(255, 204, 0, 1),
                  ),
                ),
                SizedBox(height: 8),
                ...listaIngredientes.map((ingrediente) {
                  return Text(
                    '- ${ingrediente.trim()}',
                    style: TextStyle(color: Colors.white70),
                  );
                }).toList(),
                SizedBox(height: 16),
                Divider(color: Colors.white54),
                Text(
                  'Informações adicionais',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(255, 204, 0, 1),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Descrição: $descricao',
                  style: TextStyle(color: Colors.white70),
                ),
                Text(
                  'Data do Agendamento: $dataAgendamento',
                  style: TextStyle(color: Colors.white70),
                ),
                Text(
                  'Data do Pedido: $dataPedido',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ),
                    ),
                    child: Text(
                      'Fechar',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      _showRatingDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(255, 204, 0, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ),
                    ),
                    child: Text(
                      'Avaliar',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      );
    } catch (e) {
      print("Erro ao obter ingredientes: $e");
    }
  }

  void _showRatingDialog(BuildContext context) {
    int rating = 0; // Inicializa a avaliação com 0 estrelas

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            children: [
              Icon(
                Icons.star_border,
                color: Color.fromRGBO(255, 204, 0, 1),
              ),
              SizedBox(width: 8),
              Text(
                'Avalie o Pedido',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RatingBar.builder(
                initialRating: rating.toDouble(),
                minRating: 1,
                itemSize: 40.0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Icon(
                    Icons.star,
                    color: Colors.amber,
                  );
                },
                onRatingUpdate: (newRating) {
                  rating = newRating.toInt(); // Atualiza a avaliação com base na seleção
                },
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
                // Chama o callback para enviar a avaliação
                onEnviarAvaliacao(idPedido, rating);

                Navigator.pop(context); // Fecha o modal de avaliação
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Avaliação enviada com sucesso!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(255, 204, 0, 1),
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              ),
              child: Center(
                child: Text(
                  'Enviar Avaliação',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
