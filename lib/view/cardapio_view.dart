import 'package:flutter/material.dart';
import 'package:login_gerdau/controller/cardapio_controller.dart';
import 'package:login_gerdau/view/components/appbar_components.dart';
import 'package:login_gerdau/view/components/modalCard.dart';

class CardapioView extends StatefulWidget {
  const CardapioView({super.key});

  @override
  State<CardapioView> createState() => _CardapioViewState();
}

class _CardapioViewState extends State<CardapioView> {
  PageController arrastar = PageController();
  CardapioController _controller = CardapioController();

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
                  Image.asset('assets/images/gd1.png', fit: BoxFit.cover),
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
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      ModalCard.showModalCard(
                        context: context,
                        pratoPrincipal: 'Bife grelhado',
                        acompanhamento: 'Arroz branco, feijão preto, batatas fritas e salada de alface e tomate',
                        sobremesa: 'Pudim de Leite',
                        imagemPath: 'assets/images/comida_card.png',
                      );
                    },
                    child: Card(
                      elevation: 5,
                      color: Color.fromARGB(255, 0, 0, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Column(
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      'Dia A Dia',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset('assets/images/comida_card.png',
                                        width: 150),
                                  ],
                                ),
                              ],
                            )
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
                      ModalCard.showModalCard(
                        context: context,
                        pratoPrincipal: 'Esparguete à bolonhesa',
                        acompanhamento: 'Pão de alho e parmesão ralado',
                        sobremesa: 'Mousse de chocolate',
                        imagemPath: 'assets/images/comida_card3.png',
                      );
                    },
                    child: Card(
                      elevation: 5,
                      color: Color.fromARGB(255, 0, 0, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Column(
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      'Clássico',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                        'assets/images/comida_card3.png',
                                        width: 150),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(height: 30, thickness: 2),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      ModalCard.showModalCard(
                        context: context,
                        pratoPrincipal: 'Costeletas de porco grelhadas',
                        acompanhamento: 'Puré de batata com ervas finas e salada de rúcula',
                        sobremesa: 'Cheesecake de morango',
                        imagemPath: 'assets/images/comida_card2.png',
                      );
                    },
                    child: Card(
                      elevation: 5,
                      color: Color.fromARGB(255, 0, 0, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Column(
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      'Especiale',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                        'assets/images/comida_card2.png',
                                        width: 150),
                                  ],
                                ),
                              ],
                            )
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
                      ModalCard.showModalCard(
                        context: context,
                        pratoPrincipal: 'Frango grelhado com ervas',
                        acompanhamento: 'Legumes salteados e arroz integral',
                        sobremesa: 'Salada de frutas frescas',
                        imagemPath: 'assets/images/comida_card4.png',
                      );
                    },
                    child: Card(
                      elevation: 5,
                      color: Color.fromARGB(255, 0, 0, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Column(
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      'Natural',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                        'assets/images/comida_card4.png',
                                        width: 150),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
