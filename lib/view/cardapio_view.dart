import 'package:flutter/material.dart';
import 'package:login_gerdau/controller/cardapio_controller.dart';
import 'package:login_gerdau/view/components/appbar_components.dart';

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
            //const SizedBox(height: 20),
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
            const Card(
              elevation: 5,
              color: const Color.fromRGBO(1, 52, 93, 1),
              child: const Row(
                children: [
                  const Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
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
                          const SizedBox(height: 10),
                          Text(
                            'Prato principal: Frango Grelhado',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(137, 255, 255, 255)),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Acompanhamento: Arroz, Feijão e Salada',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(137, 255, 255, 255)),
                          ),
                          const SizedBox(height: 5),
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
                  const Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
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
                          const SizedBox(height: 10),
                          Text(
                            'Prato principal: Frango Grelhado',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(137, 255, 255, 255)),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Acompanhamento: Arroz, Feijão e Salada',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(137, 255, 255, 255)),
                          ),
                          const SizedBox(height: 5),
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
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(height: 40, thickness: 2),
            const Card(
              elevation: 5,
              color: const Color.fromRGBO(1, 52, 93, 1),
              child: const Row(
                children: [
                  const Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
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
                          const SizedBox(height: 10),
                          Text(
                            'Prato principal: Frango Grelhado',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(137, 255, 255, 255)),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Acompanhamento: Arroz, Feijão e Salada',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(137, 255, 255, 255)),
                          ),
                          const SizedBox(height: 5),
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
                  const Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
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
                          const SizedBox(height: 10),
                          Text(
                            'Prato principal: Frango Grelhado',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(137, 255, 255, 255)),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Acompanhamento: Arroz, Feijão e Salada',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(137, 255, 255, 255)),
                          ),
                          const SizedBox(height: 5),
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
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
