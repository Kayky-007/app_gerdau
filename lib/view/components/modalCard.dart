import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:login_gerdau/controller/pedidos_controller.dart';
import 'package:login_gerdau/controller/pratos_controller.dart';
import 'package:login_gerdau/model/pratos_model.dart';
import 'package:login_gerdau/view/components/espacamento_h.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class ModalCard extends StatefulWidget {
  final String pratoPrincipal;
  final String acompanhamento;
  final String sobremesa;
  final String imagemPath;

  ModalCard({
    required this.pratoPrincipal,
    required this.acompanhamento,
    required this.sobremesa,
    required this.imagemPath,
  });

  @override
  State<ModalCard> createState() => _ModalCardState();

  static void showModalCard({
    required BuildContext context,
    required String pratoPrincipal,
    required String acompanhamento,
    required String sobremesa,
    required String imagemPath,
    required int idPrato,
  }) {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => ModalCard(
        pratoPrincipal: pratoPrincipal,
        acompanhamento: acompanhamento,
        sobremesa: sobremesa,
        imagemPath: imagemPath,
      ),
    );
  }
}

class _ModalCardState extends State<ModalCard> {
  late DateTime _focusedDay;
  late DateTime _selectedDay;
  late String dia_marcado;
  late String dia_API;
  bool visivel = false;
  String? selectedSize;
  PedidosController controllerPedidos = PedidosController();
  PratosController controller = PratosController();

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
    dia_marcado = DateFormat('dd/MM/yyyy').format(_selectedDay);
    dia_API = dia_marcado;
  }

  Future<PratosModel> _fetchPratosData() async {
    return await controller.obterDadosPratos(dia_API);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: FutureBuilder<PratosModel>(
          future: _fetchPratosData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Erro ao carregar os dados'));
            }

            if (!snapshot.hasData) {
              return Center(child: Text('Nenhum dado disponível'));
            }

            PratosModel pratos = snapshot.data!;

            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Confirmar Pedido",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Color.fromARGB(255, 187, 156, 82),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    widget.imagemPath,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 15),
                Visibility(
                  visible: visivel,
                  child: TableCalendar(
                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: _focusedDay,
                    selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                    onDaySelected: (selectedDay, focusedDay) async {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                        dia_marcado =
                            DateFormat('dd/MM/yyyy').format(selectedDay);
                        dia_API = dia_marcado;
                        visivel = false;
                      });
                      await _fetchPratosData();
                    },
                    calendarStyle: const CalendarStyle(
                      selectedDecoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      weekendTextStyle: TextStyle(color: Colors.red),
                    ),
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      leftChevronIcon: Icon(Icons.chevron_left),
                      rightChevronIcon: Icon(Icons.chevron_right),
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 58, 111, 179),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side:
                          BorderSide(color: Color.fromARGB(255, 58, 111, 179)),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  child: Text("Datas"),
                  onPressed: () async {
                    setState(() {
                      visivel = true;
                    });
                  },
                ),
                EspacamentoH(h: 3),
                Text(
                  'Dia Marcado: $dia_marcado',
                  style: TextStyle(
                      color: Color.fromARGB(255, 4, 165, 9),
                      fontWeight: FontWeight.bold),
                ),
                ListTile(
                  title: Text('Prato principal: ',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  subtitle: Text('${pratos.nomePrato}',
                      style: TextStyle(fontSize: 18, color: Colors.black)),
                ),
                ListTile(
                  title: Text('Acompanhamento: ',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  subtitle: Text('${pratos.ingredientes}',
                      style: TextStyle(fontSize: 18, color: Colors.black)),
                ),
                ListTile(
                  title: Text('Sobremesa: ',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  subtitle: Text('${pratos.descricaoPrato}',
                      style: TextStyle(fontSize: 18, color: Colors.black)),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(color: Colors.redAccent),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                        ),
                        child: Text("Cancelar"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 187, 156, 82),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      ),
                      child: Text("Confirmar"),
                      onPressed: () async {
                        // Realizar o pedido
                        await controllerPedidos.realizarPedido(
                          pratos.idPrato.toString(), 
                          dia_API, 
                        );

                        
                        AlertController.show(
                          "Pedido Confirmado",
                          "Seu pedido foi confirmado com sucesso!",
                          TypeAlert.success,
                        );


                        // Fechar o modal
                        Navigator.of(context).pop();
                         Navigator.pushNamed(context, '/pedidos');
                      },
                    )
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
