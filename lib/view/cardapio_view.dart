import 'package:flutter/material.dart';
import 'package:login_gerdau/controller/cardapio_controller.dart';
import 'package:login_gerdau/view/components/appbar_components.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CardapioView extends StatefulWidget {
  const CardapioView({super.key});

  @override
  State<CardapioView> createState() => _CardapioViewState();
}

class _CardapioViewState extends State<CardapioView> {
  PageController arrastar = PageController();
  CardapioController _controller = CardapioController();

    void _alertPedido(BuildContext context) {
    String? selectedSize;

    showMaterialModalBottomSheet(
      context: context,
      builder: (context) {
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
                  'assets/images/prato_exemplo.jpg', // Substitua pela imagem do prato
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 15),
              Text('Prato principal: Frango Grelhado',
                  style: TextStyle(fontSize: 18, color: Colors.black)),
              Text('Acompanhamento: Arroz, Feijão e Salada',
                  style: TextStyle(fontSize: 18, color: Colors.black)),
              Text('Sobremesa: Pudim de Leite',
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
                          child:
                              Text(size, style: TextStyle(color: Colors.black)),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedSize = value; // Atualiza a seleção
                  });
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    child: Text("Confirmar"),
                    onPressed: () {
                      if (selectedSize != null) {
                        print('Tamanho escolhido: $selectedSize');
                      }
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (context, innerBoxScrolled) => [
        AppbarfotoComponents(title: 'Cardápio'),
      ],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 230,
              child: PageView(
                controller: arrastar,
                onPageChanged: (int index) {
                  setState(() {
                    _controller.cont_pagina = index;
                  });
                },
                children: [
                  Image.asset('assets/images/gd1.jpg', fit: BoxFit.cover),
                  Image.asset('assets/images/ReceitAço.jpg', fit: BoxFit.cover),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(2, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 10,
                  width: _controller.cont_pagina == index ? 20 : 10,
                  decoration: BoxDecoration(
                    color: _controller.cont_pagina == index
                        ? Colors.blue
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _alertPedido(context);
                    },
                    child: Card(
                      elevation: 5,
                      color: const Color.fromRGBO(1, 52, 93, 1),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Escolha do dia',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(221, 255, 255, 255),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Prato principal: Frango Grelhado',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(137, 255, 255, 255)),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Acompanhamento: Arroz, Feijão e Salada',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(137, 255, 255, 255)),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Sobremesa: Pudim de Leite',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(137, 255, 255, 255)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5), // Espaço entre os cards
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _alertPedido(context);
                    },
                    child: Card(
                      elevation: 5,
                      color: const Color.fromRGBO(1, 52, 93, 1),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Escolha do dia',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(221, 255, 255, 255),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Prato principal: Frango Grelhado',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(137, 255, 255, 255)),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Acompanhamento: Arroz, Feijão e Salada',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(137, 255, 255, 255)),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Sobremesa: Pudim de Leite',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(137, 255, 255, 255)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(height: 40, thickness: 2),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _alertPedido(context);
                    },
                    child: Card(
                      elevation: 5,
                      color: const Color.fromRGBO(1, 52, 93, 1),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Escolha do dia',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(221, 255, 255, 255),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Prato principal: Frango Grelhado',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(137, 255, 255, 255)),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Acompanhamento: Arroz, Feijão e Salada',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(137, 255, 255, 255)),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Sobremesa: Pudim de Leite',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(137, 255, 255, 255)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5), // Espaço entre os cards
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _alertPedido(context);
                    },
                    child: Card(
                      elevation: 5,
                      color: const Color.fromRGBO(1, 52, 93, 1),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Escolha do dia',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(221, 255, 255, 255),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Prato principal: Frango Grelhado',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(137, 255, 255, 255)),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Acompanhamento: Arroz, Feijão e Salada',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(137, 255, 255, 255)),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Sobremesa: Pudim de Leite',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(137, 255, 255, 255)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10)
          ],
        ),
      ),
    ));
  }
}
