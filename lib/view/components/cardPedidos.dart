import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';

class CardPedidos extends StatelessWidget {
  // Informações dos pedidos
  final String prato;
  final String buffet;
  final String tamanho;
  final String horario;
  final String imagemPath;

  const CardPedidos({
    super.key,
    required this.prato,
    required this.buffet,
    required this.tamanho,
    required this.horario,
    required this.imagemPath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showAlertPedido(context),  // Função do alert 
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                    imagemPath,          // Imagem do prato
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
                        prato,                 // Nome do prato
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Buffet: $buffet',      // Categoria do prato
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Tamanho: $tamanho',      // Tamanho do prato
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      Text(
                        'Pedido: $horario',           // Horário que o prato foi pedido
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {
                    AlertController.show(
                      "Pedido Cancelado",
                      "Seu pedido foi cancelado!",
                      TypeAlert.error,
                    );
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

// Função do alert
  void _showAlertPedido(BuildContext context) {
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
                '- Frango\n- Salada\n- Arroz Branco\n- Feijão',
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
                'Buffet: $buffet',
                style: TextStyle(color: Colors.white70),
              ),
              Text(
                'Tamanho: $tamanho',
                style: TextStyle(color: Colors.white70),
              ),
              Text(
                'Horário do Pedido: $horario',
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
  }
}
