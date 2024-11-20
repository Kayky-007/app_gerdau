import 'package:flutter/material.dart';
import 'package:login_gerdau/controller/pedidos_controller.dart';
import 'package:login_gerdau/controller/pratos_controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:art_sweetalert/art_sweetalert.dart';

class CardPedidos extends StatelessWidget {
  final int idPrato;
  final String nomePrato;
  final String descricao;
  final String dataAgendamento;
  final String dataPedido;
  final String imagemPath;
  final int idPedido;
  final int notaPedido;
  final Function(int) onPedidoCancelado;
  final Function(int) onAvaliarPedido;

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
    required this.notaPedido,
    required this.onAvaliarPedido,
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
          color: Color.fromARGB(255, 187, 156, 82),
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
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Descrição: $descricao',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Data Agendamento: $dataAgendamento',
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 15, 
                          ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                      child: ElevatedButton(
                        onPressed: () async {
                          ArtSweetAlert.show(
                            context: context,
                            artDialogArgs: ArtDialogArgs(
                              denyButtonText: "Não",
                              title: "Você tem certeza que deseja cancelar o pedido?",
                              confirmButtonText: "Sim",
                              type: ArtSweetAlertType.warning,
                              onConfirm: () async {
                                bool sucesso = await _pedidosController.cancelarPedido(idPedido);
                                if (sucesso) {
                                  onPedidoCancelado(idPedido);
                                  Navigator.pop(context);
                                } else {
                                  Navigator.pop(context);
                                }
                              },
                              onCancel: () {
                                Navigator.pop(context);
                              },
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: const Color.fromARGB(188, 255, 255, 255),
                          backgroundColor: Color.fromRGBO(121, 9, 9, 1),
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
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 18,
                          ),
                          SizedBox(width: 4),
                          Text(
                            '$notaPedido/5',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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

      final listaIngredientes = ingredientes.split(',');

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
                  color: Color.fromARGB(255, 187, 156, 82),
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
                    color: Color.fromARGB(255, 187, 156, 82),
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
                    color: Color.fromARGB(255, 187, 156, 82),
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
                      backgroundColor: Color.fromARGB(255, 187, 156, 82),
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
                      style: TextStyle(color: Colors.white, fontSize: 16),
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
    int rating = notaPedido;

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
                color: Color.fromARGB(255, 187, 156, 82),
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
                    color: Color.fromARGB(255, 187, 156, 82),
                  );
                },
                onRatingUpdate: (newRating) {
                  rating = newRating.toInt();
                },
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
                bool sucesso = await _pedidosController.enviarAvaliacao(idPedido, rating);
                if (sucesso) {
                  onAvaliarPedido(rating);
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 187, 156, 82),
              ),
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }
}
