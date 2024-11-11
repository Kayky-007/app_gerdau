import 'package:flutter/material.dart';
import 'package:login_gerdau/controller/pedidos_controller.dart';
import 'package:login_gerdau/view/components/appbar_components.dart';
import 'package:login_gerdau/view/components/cardPedidos.dart';
import 'package:login_gerdau/model/pedidos_model.dart';  // Importe a classe PedidosModel
import 'package:intl/intl.dart';  // Importando a biblioteca intl para formatação da data

class PedidosView extends StatefulWidget {
  const PedidosView({super.key});

  @override
  State<PedidosView> createState() => _PedidosViewState();
}

class _PedidosViewState extends State<PedidosView> {
  late List<PedidosModel> _pedidos = [];
  bool _isLoading = true;
  final PedidosController _pedidosController = PedidosController();

  @override
  void initState() {
    super.initState();
    _carregarPedidos();
  }

  Future<void> _carregarPedidos() async {
    try {
      final pedidos = await _pedidosController.obterPedidosDia();
      setState(() {
        _pedidos = pedidos;
        _isLoading = false; // Dados carregados, pode exibir a UI
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Erro ao carregar os pedidos")));
    }
  }

  // Função para formatar a data no formato brasileiro (dd/MM/yyyy)
  String formatarData(String data) {
    // Converte a string de data para um objeto DateTime
    DateTime dateTime = DateTime.parse(data);
    
    // Usa o DateFormat para formatar a data no formato brasileiro
    String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);

    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxScrolled) => [
          AppbarfotoComponents(title: 'Pedidos'),
        ],
        body: _isLoading
            ? Center(child: CircularProgressIndicator()) // Mostra carregando enquanto os dados não chegam
            : ListView.builder(
                itemCount: _pedidos.length,
                itemBuilder: (context, index) {
                  final pedido = _pedidos[index];
                  final dataFormatada = formatarData(pedido.dataPedido);  // Formata a data
                  return Column(
                    children: [
                      CardPedidos(
                        prato: pedido.nomePrato,
                        descricao: pedido.descricaoPrato,
                        horario: dataFormatada,  // Exibe a data formatada
                        imagemPath: 'assets/images/comida_card.png', // Ajuste a imagem conforme necessário
                      ),
                      SizedBox(height: 20),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
