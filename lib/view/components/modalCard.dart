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
  final String nomePrato;
  final int idPrato;

  ModalCard({
    required this.idPrato,
    required this.nomePrato,
  });

  @override
  State<ModalCard> createState() => _ModalCardState();

  static void showModalCard({
    required BuildContext context,
    required int idPrato,
    required String nomePrato,
  }) {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => ModalCard(
        idPrato: idPrato,
        nomePrato: nomePrato,
      ),
    );
  }
}

class _ModalCardState extends State<ModalCard> {
  late DateTime _focusedDay;
  late DateTime _selectedDay;
  late final idPrato;
  late String dia_marcado;
  late String dia_API;
  bool visivel = false;
  PratosModel? pratos; // Variável para armazenar os dados dos pratos
  PedidosController controllerPedidos = PedidosController();
  PratosController controller = PratosController();

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
    dia_marcado = DateFormat('dd/MM/yyyy').format(_selectedDay);
    dia_API = dia_marcado;
    idPrato = widget.idPrato;
  }

  Future<void> _fetchPratosData() async {
    PratosModel? data = await controller.obterDadosPratoPorDia(dia_API, idPrato);
    setState(() {
      pratos = data;
    });
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
                  "Confirmar Pedido", //\n (${DateFormat('dd/MM/yyyy').format(_selectedDay)}),
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
                    dia_marcado = DateFormat('dd/MM/yyyy').format(selectedDay);
                    dia_API = dia_marcado;
                    visivel = false;
                  });
                  await _fetchPratosData(); // Carrega os dados quando a data é selecionada
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
                  side: BorderSide(color: Color.fromARGB(255, 58, 111, 179)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              child: Text("Agendar Pedido"),
              onPressed: () {
                setState(() {
                  visivel = true;
                });
              },
            ),
            EspacamentoH(h: 3),
            ListTile(
              title: Text('Buffet: ',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              subtitle: Text(widget.nomePrato,
                  style: TextStyle(fontSize: 18, color: Colors.black)),
            ),
            // Agora os acompanhamentos aparecem somente após a data ser selecionada
            if (pratos != null && pratos!.ingredientes != null) 
              ListTile(
                title: Text(
                  'Acompanhamento:',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: pratos!.ingredientes!
                      .split(',')
                      .map((ingrediente) => Text(
                            '- ${ingrediente.trim()}',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ))
                      .toList(),
                ),
              )
            else 
              ListTile(
                title: Text(
                  'Acompanhamento:',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Ingredientes não encontrados',
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
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
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  child: Text("Confirmar"),
                  onPressed: () async {
                    // Realizar o pedido
                    await controllerPedidos.realizarPedido(
                      pratos!.idPrato.toString(),
                      dia_API,
                    );

                    AlertController.show(
                      "Pedido Confirmado",
                      "Seu pedido foi confirmado com sucesso!",
                      TypeAlert.success,
                    );

                    // Fechar o modal
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
