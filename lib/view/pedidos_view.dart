import 'package:flutter/material.dart';
import 'package:login_gerdau/view/components/espacamento_h.dart';

class PedidosView extends StatefulWidget {
  const PedidosView({super.key});

  @override
  State<PedidosView> createState() => _PedidosViewState();
}

class _PedidosViewState extends State<PedidosView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Detalhes do Pedido'),
        backgroundColor: Color.fromARGB(255, 1, 52, 96),
        centerTitle: true,
        elevation: 10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              clipBehavior: Clip.hardEdge,
              elevation: 10,
              shadowColor: Colors.black.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                splashColor: Colors.blue.withAlpha(50),
                onTap: () {
                  debugPrint(
                      'Seu pedido é um frango frito com salada e de sobremesa pudim.');
                },
                child: Row(
                  children: [
                    Hero(
                      tag: 'pedido-imagem',
                      child: Image.network(
                        'https://espetinhodesucesso.com/wp-content/uploads/2023/12/Receitas-de-frango-frito.jpg',
                        width: 130,
                        height: 215,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Frango Frito com Salada e Pudim',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF34495E),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Delicioso frango frito acompanhado de salada e pudim de sobremesa.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF7F8C8D),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    print('Excluir pedido');
                                  },
                                  icon:  Icon(Icons.delete),
                                  label: Text('Excluir'),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: const Color.fromARGB(255, 168, 14, 14),
                                    
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding:  EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const EspacamentoH(h: 20),
            
          ],
        ),
      ),
    );
  }
}
