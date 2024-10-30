// alert_pedido_component.dart
import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ModalCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    String? selectedSize;

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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Confirmar Pedido",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Color(0xFF1A4D6E),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imagemPath,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 15),
          Text('Prato principal: $pratoPrincipal',
              style: TextStyle(fontSize: 18, color: Colors.black)),
          Text('Acompanhamento: $acompanhamento',
              style: TextStyle(fontSize: 18, color: Colors.black)),
          Text('Sobremesa: $sobremesa',
              style: TextStyle(fontSize: 18, color: Colors.black)),
          SizedBox(height: 20),
          DropdownButtonFormField<String>(
            value: selectedSize,
            decoration: InputDecoration(
              labelText: 'Escolha o Tamanho',
              labelStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.grey),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            ),
            style: TextStyle(color: Colors.black, fontSize: 16),
            dropdownColor: Colors.white,
            items: ['Pequeno', 'Médio', 'Grande']
                .map((size) => DropdownMenuItem(
                      value: size,
                      child: Text(size, style: TextStyle(color: Colors.black)),
                    ))
                .toList(),
            onChanged: (value) {
              selectedSize = value;
            },
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
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A4D6E),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: Text("Confirmar"),
                onPressed: () {
                  if (selectedSize != null) {
                    print('Prato escolhido: $pratoPrincipal');
                    print('Tamanho escolhido: $selectedSize');
                  }
                  AlertController.show(
                      "Pedido Confirmado",
                      "Seu pedido foi confirmado com sucesso!",
                      TypeAlert.success);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  static void showModalCard({
    required BuildContext context,
    required String pratoPrincipal,
    required String acompanhamento,
    required String sobremesa,
    required String imagemPath,
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
