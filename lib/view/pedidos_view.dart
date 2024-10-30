import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:login_gerdau/view/components/appbar_components.dart';
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
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxScrolled) => [
          AppbarfotoComponents(title: 'Pedidos'),
        ],
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  color: Color.fromARGB(255, 1, 52, 96),
                  clipBehavior: Clip.hardEdge,
                  elevation: 10,
                  shadowColor: Colors.black.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Hero(
                        tag: 'imagem do frangão',
                        child: Image.network(
                          'https://espetinhodesucesso.com/wp-content/uploads/2023/12/Receitas-de-frango-frito.jpg',
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Frango Frito',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(255, 204, 0, 1),
                              ),
                            ),
                            EspacamentoH(h: 8),
                            const Text(
                              'Delicioso frango frito acompanhado com salada ',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            EspacamentoH(h: 16),
                            Divider(
                              height: 2,
                            ),
                            EspacamentoH(h: 8),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Buffet:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(255, 204, 0, 1),
                                    )),
                                Text(
                                  'Dia a Dia',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            EspacamentoH(h: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Tamanho:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(255, 204, 0, 1),
                                    )),
                                Text(
                                  'Médio',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            EspacamentoH(h: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Horário do Pedido:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(255, 204, 0, 1),
                                    )),
                                Text(
                                  '12:30 PM',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            EspacamentoH(h: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Estimativa de Pronto:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(255, 204, 0, 1),
                                    )),
                                Text(
                                  '13:00 PM',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            EspacamentoH(h: 8),
                            Divider(
                              height: 2,
                            ),
                            EspacamentoH(h: 8),
                            // Ingredientes
                            Text(
                              'Ingredientes:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(255, 204, 0, 1),
                              ),
                            ),
                            EspacamentoH(h: 8),
                            Text(
                              '- Frango',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            Text(
                              '- Salada',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            Text(
                              '- Arroz Branco',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            Text(
                              '- Feijão',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),

                            EspacamentoH(h: 8),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    AlertController.show(
                                        "Pedido Cancelado",
                                        "Seu pedido foi cancelado!",
                                        TypeAlert.error);
                                  },
                                  icon: Icon(Icons.cancel),
                                  label: Text('Cancelar Pedido'),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.redAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    padding: EdgeInsets.symmetric(
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
                    ],
                  ),
                ),
                EspacamentoH(h: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
