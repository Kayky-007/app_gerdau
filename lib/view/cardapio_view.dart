import 'package:flutter/material.dart';
import 'package:login_gerdau/view/components/appbar_components.dart';
import 'package:login_gerdau/view/components/drawer_components.dart';
import 'package:login_gerdau/view/components/modalCard.dart';
class CardapioView extends StatefulWidget {
  const CardapioView({super.key});

  @override
  State<CardapioView> createState() => _CardapioViewState();
}

class _CardapioViewState extends State<CardapioView> {
  PageController arrastar = PageController();
  int cont_pagina = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Adiciona o Drawer aqui
      drawer: CustomDrawer(), // Usa o Drawer personalizado
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
                      cont_pagina = index;
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
                    width: cont_pagina == index ? 20 : 10,
                    decoration: BoxDecoration(
                      color: cont_pagina == index
                          ? Color.fromARGB(255, 187, 156, 82)
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          ModalCard.showModalCard(
                              nomePrato: 'Dia a Dia',
                              context: context,
                              idPrato: 1 // esse valor para idPrato
                              );
                        },
                        child: Card(
                          elevation: 5,
                          color: Color.fromARGB(255, 187, 156, 82),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Column(
                                  children: [
                                    const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Dia a Dia',
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/images/cardFoto.png',
                                            width: 120),
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
                    SizedBox(width: 5),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          ModalCard.showModalCard(
                              context: context,
                              nomePrato: 'Clássico',
                              idPrato: 3 // esse valor para idPrato
                              );
                        },
                        child: Card(
                          elevation: 5,
                          color: Color.fromARGB(255, 187, 156, 82),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Column(
                                  children: [
                                    const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
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
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                            'assets/images/cardFoto.png',
                                            width: 120),
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
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Divider(height: 30, thickness: 2),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          ModalCard.showModalCard(
                              context: context,
                              nomePrato: 'Especiale',
                              idPrato: 2 // esse valor para idPrato
                              );
                        },
                        child: Card(
                          elevation: 5,
                          color: Color.fromARGB(255, 187, 156, 82),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Column(
                                  children: [
                                    const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
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
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                            'assets/images/cardFoto.png',
                                            width: 120),
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
                              nomePrato: 'Natural',
                              idPrato: 4 // esse valor para idPrato
                              );
                        },
                        child: Card(
                          elevation: 5,
                          color: Color.fromARGB(255, 187, 156, 82),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Column(
                                  children: [
                                    const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
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
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                            'assets/images/cardFoto.png',
                                            width: 120),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
