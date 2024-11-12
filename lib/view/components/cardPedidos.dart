import 'package:flutter/material.dart';
import 'package:login_gerdau/controller/pedidos_controller.dart';
import 'package:login_gerdau/controller/pratos_controller.dart';

class CardPedidos extends StatelessWidget {
  final int idPrato;
  final String nomePrato;
  final String descricao;
  final String dataAgendamento;
  final String dataPedido;
  final String imagemPath;
  final int idPedido; 
  final Function(int) onPedidoCancelado;

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
  // Esperar a resposta da API antes de mostrar o alerta
  try {
    // Aguarda a resposta da API
    final prato = await _pratosController.listarPratoCardapioDia(idPrato, dataAgendamento);
    
    // Extraímos os ingredientes da resposta
    final ingredientes = prato.ingredientes ?? "Ingredientes não encontrados"; 

    // Exibe o alerta com os ingredientes
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
              Text(
                ingredientes,
                style: TextStyle(color: Colors.white70),
              ),
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
            Center(
              child: ElevatedButton(
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
            ),
          ],
        );
      },
    );
  } catch (e) {
    // Caso ocorra algum erro, exibe uma mensagem de erro
    print("Erro ao obter ingredientes: $e");
  }
}
}
